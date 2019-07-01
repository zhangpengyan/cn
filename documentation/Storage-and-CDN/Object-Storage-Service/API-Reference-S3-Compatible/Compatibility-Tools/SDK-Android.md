# SDK-Android

# 概述

您可以使用Android SDK管理京东云对象存储，可从https://github.com/aws/aws-sdk-android 下载Android Source Code

#  操作

由于android sdk用chunk 方式进行传输，并且把chunk-signature放置在body中，oss不支持这种case；sdk中支持的参数 S3ClientOptions.builder.disableChunkedEncoding在判断的时候并没有采用，因而需要更深层次的hack，需要继承AWSS3V4Signer.java并且覆盖原始的processRequestPayload（计算payload的签名并放在body的开头）和calculateContentHash（长度包含签名部分），代码如下：
```Java
package com.amazonaws.demo.s3transferutility;
 import com.amazonaws.AmazonClientException;
 import com.amazonaws.Request;
 import com.amazonaws.services.s3.Headers;
 import com.amazonaws.services.s3.internal.AWSS3V4Signer;
 import com.amazonaws.util.BinaryUtils;
 import java.io.IOException;
 import java.io.InputStream;
 public class JdAWSS3V4Signer extends AWSS3V4Signer {
     @Override
     protected void processRequestPayload(Request<?> request, HeaderSigningResult headerSigningResult) {
     }
  
     @Override
     protected String calculateContentHash(Request<?> request) {
         request.addHeader("x-amz-content-sha256", "required");
         final String contentLength =
                 request.getHeaders().get(Headers.CONTENT_LENGTH);
         final long originalContentLength;
         if (contentLength != null) {
             originalContentLength = Long.parseLong(contentLength);
         } else {
             /**
              * "Content-Length" header could be missing if the caller is
              * uploading a stream without setting Content-Length in
              * ObjectMetadata. Before using sigv4, we rely on HttpClient to
              * add this header by using BufferedHttpEntity when creating the
              * HttpRequest object. But now, we need this information
              * immediately for the signing process, so we have to cache the
              * stream here.
              */
             try {
                 originalContentLength = getContentLength(request);
             } catch (IOException e) {
                 throw new AmazonClientException(
                         "Cannot get the content-lenght of the request content.",
                         e);
             }
         }
         request.addHeader("x-amz-decoded-content-length",
                 Long.toString(originalContentLength));
         final InputStream payloadStream = getBinaryRequestPayloadStream(request);
         payloadStream.mark(-1);
         final String contentSha256 = BinaryUtils.toHex(hash(payloadStream));
         try {
             payloadStream.reset();
         } catch (final IOException e) {
             throw new AmazonClientException(
                     "Unable to reset stream after calculating AWS4 signature", e);
         }
         return contentSha256;
     }
  
     private long getContentLength(Request<?> request) throws IOException {
         InputStream content = request.getContent();
         if (!content.markSupported()) {
             throw new AmazonClientException("Failed to get content length");
         }
         final int DEFAULT_BYTE_LENGTH = 4096;
         long contentLength = 0;
         byte[] tmp = new byte[DEFAULT_BYTE_LENGTH];
         int read;
         content.mark(-1);
         while ((read = content.read(tmp)) != -1) {
             contentLength += read;
         }
         content.reset();
         return contentLength;
     }
 }
```

然后利用SignerFactory.registerSigner("JdAWSS3V4Signer", JdAWSS3V4Signer.class)替换标准签名，实现代码如下：
```Java
SignerFactory.registerSigner("JdAWSS3V4Signer", JdAWSS3V4Signer.class);
 System.setProperty(SDKGlobalConfiguration.ENABLE_S3_SIGV4_SYSTEM_PROPERTY, "true");
 ClientConfiguration config = new ClientConfiguration();
 config.setProtocol(Protocol.HTTP);
 config.setSignerOverride("JdAWSS3V4Signer");
 sS3Client = new AmazonS3Client(getCredProvider(context.getApplicationContext()), config);
 sS3Client.setEndpoint("https://s3.cn-north-1.jdcloud-oss.com");
 S3ClientOptions options = S3ClientOptions.builder()
         .disableChunkedEncoding()
         .setPayloadSigningEnabled(true)
         .build();
 sS3Client.setS3ClientOptions(options);
```
## Demo下载

[点击下载](http://s3-sdk-demo.oss.cn-north-1.jcloudcs.com/android-sdk/s3-android-demo.zip)
