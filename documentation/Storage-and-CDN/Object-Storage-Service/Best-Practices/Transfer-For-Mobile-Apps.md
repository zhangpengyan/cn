# 移动应用直传OSS

## 简介

本文主要介绍基于京东云对象存储 OSS，如何实现移动应用直传至OSS。作为移动APP开发者，您可以利用OSS处理各种数据的存储及分发需求，从而更加专注于自己的应用逻辑。

基于OSS的移动应用数据直传服务具有以下优势：

 - 数据安全：使用灵活的预签名URL进行数据的上传和下载，更加安全；
 - 成本低廉：数据不需要由APP Server中转；移动APP直接连接OSS，只有控制流连接应用服务器；
 - 弹性扩容：无限扩容的存储空间；
 - 数据处理：和图片处理以及音视频转码搭配使用，方便灵活地进行数据处理；

## 原理介绍

对于客户端应用，把访问密钥放到客户端代码中，这既容易泄露您的密钥信息，也不便于控制用户访问权限。通过预签名URL，您可以临时授权您的 App 访问您的存储资源，而不会泄露您的访问密钥。

预签名URL简介：

默认情况下，所有的对象和存储桶都是私有的。如果您希望您的用户能够将特定对象上传到您的存储桶，但不希望他们使用您的访问秘钥，则可以使用预签名URL。创建预签名URL时，您可以指定存储桶名称、对象名称、HTTP方法（如执行PUT操作）和有效期。身份验证信息将以查询字符串参数的形式提供，超出有效期后该预签名URL将失效。

移动应用直传服务的开发流程图如下：

![移动应用直传](../../../../image/Object-Storage-Service/OSS-104.png)

流程说明：

 - 1.移动应用向应用服务器请求预签名URL；
 
 - 2.应用服务器生成预签名URL，并返回给移动应用客户端；
 
 - 3.移动应用使用预签名URL将文件上传至OSS；
 
 - 4.传输完成后，OSS返回上传成功消息；
 
 - 5.若用户配置了上传回调通知，则OSS会异步回调应用服务器；
 
 - 6.应用服务器收到回调消息后返回回调成功消息。
 
## 应用服务器示例代码
 
您可以在应用服务器上部署以下示例代码用于生成预签名URL，您可以根据您的业务逻辑调整该示例代码。移动应用在请求OSS前，可请求应用服务器返回预签名URL，需根据OSS访问需求传入预签名的相关参数（如Bucket、Key、HTTP Method等）。

本示例基于S3 JAVA SDK编写，SDK安装与使用可参考[JAVA SDK安装](../API-Reference-S3-Compatible/Compatibility-Tools/SDK-Java/Installation-S3.md)。

```Java
import java.net.URL;
import java.util.Date;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.HttpMethod;
import com.amazonaws.Protocol;
import com.amazonaws.SDKGlobalConfiguration;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.S3ClientOptions;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;

public class PresignUrl {
    static AmazonS3 createS3Client(String accessKey, String secretKey, String endpoint) {
        System.setProperty(SDKGlobalConfiguration.ENABLE_S3_SIGV4_SYSTEM_PROPERTY, "true");
        AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey,secretKey);
        ClientConfiguration config = new ClientConfiguration();
        config.setProtocol(Protocol.HTTP);
        AmazonS3 s3 = new AmazonS3Client(awsCredentials,config);
        s3.setEndpoint(endpoint);
        S3ClientOptions options = new S3ClientOptions();
        options.withChunkedEncodingDisabled(true); // Must have
        s3.setS3ClientOptions(options);
        return s3;
    }
    static public URL generatePresignUrl(String accessKey, String secretKey, String endpoint, String bucketName, String keyName, HttpMethod method, Date expiration) {
        AmazonS3 s3 = createS3Client(accessKey,secretKey,endpoint);
        GeneratePresignedUrlRequest request = new GeneratePresignedUrlRequest(bucketName, keyName)
                .withMethod(method)
                .withExpiration(expiration);
        return s3.generatePresignedUrl(request);
    }
    static public void main(String [ ]str) {
        final String accessKey = "<your accessKey>";
        final String secretKey = "<your secretKey>";
        final String endpoint = "<your endpoint>";
        final String bucketName = "<your bucketname>";
        final String keyName = "<your keyname>";
        final HttpMethod method = HttpMethod.PUT;  //此处设置您的PresignUrl允许的HTTP方法
        final Integer expireInSeconds = 100;  //此处设置您的PresignUrl有效的时间段，以秒为单位
        final Date expiration = new Date(System.currentTimeMillis() + expireInSeconds * 1000);

        URL url = generatePresignUrl(accessKey, secretKey, endpoint, bucketName, keyName, method, expiration);
        System.out.println("Pre-Signed URL: " + url);
    }
}
```

## 使用预签名URL

预签名URL生成完成后，应用服务器需将该URL返回给移动应用。移动应用可以使用该预签名URL访问OSS，该URL仅可在指定的有效期内使用，仅支持使用指定的HTTP Method访问指定的资源（即生成预签名URL时指定的Method、Bucket、Key）。

预签名URL示例：

```
http://testbucket.s3.cn-north-1.jcloudcs.com/testkey
?X-Amz-Algorithm=AWS4-HMAC-SHA256
&X-Amz-Date=20190117T061845Z
&X-Amz-SignedHeaders=host
&X-Amz-Expires=98
&X-Amz-Credential=59E6DC72927457BDEBF36A56EE616B07
%2F20190117%2Fcn-north-1%2Fs3%2Faws4_request
&X-Amz-Signature=cc379e30731236473de05dcb7a3ad1b275fb0d6af58ecfdbd06e2dd051dd57ed
```

注：预签名URL不会暴露您的AccessKey Secret。

使用Curl命令模拟使用预签名URL上传文件，示例命令如下：

```Shell
curl -X PUT -T testfile "http://testbucket.s3.cn-north-1.jcloudcs.com/testkey?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20190117T044444Z&X-Amz-SignedHeaders=host&X-Amz-Expires=98&X-Amz-Credential=59E6DC72927457BDEBF36A56EE616B07%2F20190117%2Fcn-north-1%2Fs3%2Faws4_request&X-Amz-Signature=a21204debab7c0b0c4ba334e6a9f76d5b6ce3328591acc29890540ddee513dcf" -v
```

## 配置回调通知

由于移动应用上传数据时，并不通过应用服务器中转，而是直接传输至OSS。若应用服务器需要知道移动应用上传了哪些文件吗，可以通过配置回调通知功能实现。更多信息请参考[回调通知](../Operation-Guide/Manage-Bucket/Callback-Notification-2.md)，您可以指定存储桶资源变动时及时进行回调通知。

您可按照以下示例配置您的应用服务器作为回调服务器，当回调通知触发时，OSS将会向回调URL发起消息通知，事件消息为JSON格式，您可以从事件消息中解析您需要的内容。

```Java
import org.springframework.http.HttpHeaders;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.*;
import java.nio.charset.StandardCharsets;

@RestController
public class SubscriptionTest {

    //简单格式的消息通知
    @RequestMapping("/notifications1")
    public String notifications1(@RequestBody String message
            , @RequestHeader HttpHeaders headers) {
		
        if (headers.get("x-jdcloud-message-type").get(0).equals("SubscriptionConfirmation")) {
			//设置时对url的校验，需要对message进行base64编码并返回
            return Base64Utils.encodeToString(message.getBytes(StandardCharsets.UTF_8));
        } else {
            //消息通知处理  your code，处理完毕后需要返回 http code 200，body不做校验
            return "";
        }
    }
}
```
