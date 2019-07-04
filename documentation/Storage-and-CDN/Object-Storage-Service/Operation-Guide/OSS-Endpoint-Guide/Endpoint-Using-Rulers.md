
# OSS访问域名使用规则 

OSS会为每一个存储空间（Bucket）分配默认的访问域名，本文介绍OSS访问域名的构成规则及使用方式。

## OSS域名构成规则 

针对OSS的网络请求，除了GetService这个API以外，其他所有请求的域名都是带有指定Bucket信息的域名组成的。

访问域名结构：BucketName.Endpoint。

BucketName为您的存储空间名称，Endpoint为存储空间对应的地域域名。

**说明：** 

-   OSS以HTTP RESTful API的形式对外提供服务，当访问不同的地域（Region）时，需要不同的访问域名。
-   Endpoint分内网和外网访问域名。例如：s3.cn-south-1.jdcloud-oss.com 指向华南-广州地域的外网访问地址。内网访问地址s3-internal.cn-south-1.jdcloud-oss.com 指向华南-广州地域内网地址，在京东云VPC中使用OSS 建议使用内网访问域名，上传与下载流量均免费。Region和Endpoint对照表请参考[访问域名和地域](./Oss-endpont-list.md)。
-   您也可以通过[设置自定义域名](https://docs.jdcloud.com/cn/object-storage-service/set-custom-domain-name-2)，将OSS的外网访问域名替换为您的自有域名。

## 通过外网访问OSS服务

外网（公网）指的是通过互联网访问OSS。通过外网访问产生的流入流量（写）是免费的，流出流量（读）是收费的。

**说明：** OSS费用详情请参见[OSS价格总览](https://docs.jdcloud.com/cn/object-storage-service/price-overview)。

外网访问OSS有如下两种方式：

-   **访问方式一：访问时以URL的形式来表示OSS的资源。OSS的URL构成如下：**


```
<Schema>://<Bucket>.<外网Endpoint>/<Object> 
```

-   Schema：HTTP或者为HTTPS
-   Bucket：OSS存储空间名称
-   Endpoint：Bucket所在地域的访问域名，您需要填写外网Endpoint
-   Object：上传到OSS上的文件

示例：如您的Region为华北-北京（s3.cn-north-1.jdcloud-oss.com），Bucket名称为123，Object访问路径为myfile/aaa.txt，那么您的外网访问地址为：


```
123.s3.cn-north-1.jdcloud-oss.com/myfile/aaa.txt

```

**说明：** 

OSS访问域名需携带Object访问路径才可以被访问，仅访问域名，如`123.s3.cn-north-1.jdcloud-oss.com`，会有报错提示。

您还可以直接将Object的URL放入HTML中使用，如下所示：

```HTML

<img src="https:// 123.s3.cn-north-1.jdcloud-oss.com/myfile/aaa.png">

```

-   **访问方式二： 通过OSS SDK配置外网访问域名。**

    OSS SDK会对您的每一个操作拼接访问域名。但您在对不同地域的Bucket进行操作的时候需要设置不同的Endpoint。

    以Java SDK为例，对位于华北-北京的Bucket进行操作时，需要在对类实例化时设置Endpoint：
    
 ```Java
    
   public class S3SdkTest{
    public static void main(String[ ] args)  {
        final String accessKey = "<your accesskey>";
        final String secretKey = "<your secretkey>";
        final String endpoint = "https://s3.cn-north-1.jdcloud-oss.com";
        ClientConfiguration config = new ClientConfiguration();
 
        AwsClientBuilder.EndpointConfiguration endpointConfig =
                new AwsClientBuilder.EndpointConfiguration(endpoint, "cn-north-1");
 
        AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey,secretKey);
        AWSCredentialsProvider awsCredentialsProvider = new AWSStaticCredentialsProvider(awsCredentials);
 
        AmazonS3 s3 = AmazonS3Client.builder()
                .withEndpointConfiguration(endpointConfig)
                .withClientConfiguration(config)
                .withCredentials(awsCredentialsProvider)
                .disableChunkedEncoding()
                .withPathStyleAccessEnabled(true)
                .build();
    }
 }
   
```


## 通过内网访问OSS服务 

内网指的是京东云产品之间的内网通信网络，例如您通过云主机（VM）访问OSS服务。内网产生的流入和流出流量均免费，其他费用照常计费。

内网访问OSS有如下两种方式：

-   **访问方式一：在访问的时候以URL的形式来表示OSS的资源。OSS的URL构成如下。**


```
<Schema>://<Bucket>.<内网Endpoint>/<Object> 
```

-   Schema：HTTP或者为HTTPS
-   Bucket：OSS存储空间
-   Endpoint：Bucket所在数据中心的访问域名，您需要填写内网Endpoint
-   Object：上传到OSS上的文件
  示例：如您的Region为华北-北京（s3-internal.cn-north-1.jdcloud-oss.com），Bucket名称为123，Object访问路径为myfile/aaa.txt，那么您的内网访问地址为：

```
123.s3-internal.cn-north-1.jdcloud-oss.com/myfile/aaa.txt
```


-   **访问方式二：通过VM使用OSS SDK配置内网访问域名。**

    以Java SDK为例，对位于华北-北京的Bucket进行操作时，需要在对类实例化时设置Endpoint：

```Java
     public class S3SdkTest{
      public static void main(String[ ] args)  {
          final String accessKey = "<your accesskey>";
          final String secretKey = "<your secretkey>";
          final String endpoint = "https://s3-internal.cn-north-1.jdcloud-oss.com";
          ClientConfiguration config = new ClientConfiguration();

          AwsClientBuilder.EndpointConfiguration endpointConfig =
                  new AwsClientBuilder.EndpointConfiguration(endpoint, "cn-north-1");

          AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey,secretKey);
          AWSCredentialsProvider awsCredentialsProvider = new AWSStaticCredentialsProvider(awsCredentials);

          AmazonS3 s3 = AmazonS3Client.builder()
                  .withEndpointConfiguration(endpointConfig)
                  .withClientConfiguration(config)
                  .withCredentials(awsCredentialsProvider)
                  .disableChunkedEncoding()
                  .withPathStyleAccessEnabled(true)
                  .build();
      }
  }
```

 
 **说明：**   
    
同一个Region的VM和OSS之间内网互通，不同Region的VM和OSS之间内网不互通,只能使用外网访问域名。

例如，您的OSS有两个Bucket，并且购买了华北-北京（s3-internal.cn-north-1.jdcloud-oss.com）的VM：

*  其中一个Bucket名称为examplebeijing，Region为华北-北京，那么在华北-北京的ECS中可以使用`s3-internal.cn-north-1.jdcloud-oss.com`
来访问 beijingres 的资源。
*  另外一个Bucket名称为exampleguangzhou，Region为华南-广州，那么在华北-北京的ECS用内网地址`s3-internal.cn-south-1.jdcloud-oss.com`
是无法访问OSS的，必须使用外网地址`s3.cn-south-1.jdcloud-oss.com`。

