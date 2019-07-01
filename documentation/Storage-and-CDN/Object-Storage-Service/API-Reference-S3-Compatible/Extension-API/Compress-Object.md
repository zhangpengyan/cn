# Compress Object

## API描述

您可以通过将京东云对象存储中的多个Object压缩成一个Object后进行打包下载及其他操作。

**请求**

1.格式
```
POST /path/to/zip/object?compress HTTP/1.1 
Host:bucket.s3.region.jdcloud-oss.com
Authorization:<Authorization_String>
Content-Type:text/xml 
Content-Length:1024 
Content-MD5:Q2hlY2sgSW50ZWdyaXR5IQ== 
Cache-Control:max-age=300 
Content-Disposition:"attachment;filename=FileName.txt" 
Expires:Wed, 21 Oct 2015 07:28:00 GMT 
x-amz-notification-endpoint:http://example.com/on_compress_done 
x-amz-compress-type:zip
```
2.Header

|名称|必须|描述|
|-|-|-|
|Content-Type|是|必须为text/xml，表示配置文件的格式为XML，生成压缩文件的Content-Type用户不能设置，根据压缩类型设置为application/zip、application/x-rar-compressed等|
|Content-Length|是|标准header|
|Content-MD5|否|标注header，如果用户传了该参数，服务端会做校验|
|Cache-Control|否|生成compress对象的Cache-Control|
|Content-Disposition|否|生成compress对象的Content-Disposition|
|Expires|否|生成compress对象的Expires|
|x-amz-notification-endpoint|否|生成任务完成之后回调的地址，格式为http://example.com/on_compress_done，如果用户设置该参数，则OSS在压缩完成之后会通过HTTP POST回调该URL，请求的具体格式请参考下文中与回调相关的文档|
|x-amz-compress-type|否|压缩的类型，默认为zip格式，目前只支持zip|

3.Query

|名称|类型|必须|描述|
|-|-|-|-|
|compress|空|是|表明该请求为CompressObject请求|

4.Elements(body)

|名称|类型|必须|描述|
|-|-|-|-|
|CompressRequest|Object|是|请求的根|
|+Component|Object数组|是|生成该压缩文件的文件的信息|
|++Key|字符串|是|生成该压缩文件的文件的完整的Key|
|++Alias|字符串|否|在压缩文件中该文件的名字，默认为key，可以用来改名或者调整目录结构|

**响应**

Header

无特殊header

Elements

无响应Elements

Error

该功能没有定义特殊错误，在使用过程中遇到错误返回的都是鉴权或Bucket相关错误

## 回调

在compress object生成任务完成后，如果用户在请求中设置了任务完成的回调地址（即上文中的x-amz-notification-endpoint参数），OSS会通过POST方式回调用户提供的回调接口，通知用户任务处理的结果。

回调接口

|Header|描述|
|-|-|
|x-amz-sns-message-type|必须为Notification|
|x-amz-sns-raw-key|必须为true|
|RequestID|RequestID|

**成功回调**
```
{
    "Records": [
        {
            "eventName": "ObjectCreated:Compress",
            "s3": {
                "s3SchemaVersion": "1.0",
                "bucket": {
                    "name": "bucket-name"
                },
                "object": {
                    "key": "object-key",
                    "size": 1024,
                    "eTag": "object eTag"
                }
            }
        }
    ]
}
```
失败回调
```
{
    "Records": [
        {
            "eventName": "Error:CompressFailed",
            "error": {
                "s3ErrorSchemaVersion": "1.0",
                "code": "NoSuchKey",
                "resourse": "/path/to/not/exist/object/key",
                "message": "The specified key does not exist.",
                "requestId": "AB2138B5D4C95193"
            },
            "s3": {
                "s3SchemaVersion": "1.0",
                "bucket": {
                    "name": "bucket-name"
                },
                "object": {
                    "key": "object-key",
                }
            }
        }
    ]
}
```
**回调保证**

每个请求，无论成功或者失败，都会回调，且在生成完成Object的第一时间回调

在服务端临时不可用的时候，回调会重试，重试的间隔时间会逐渐增长，如果一天内重试都没法成功，则该回调会被抛弃

回调的顺序不做任何保证，跟发起Compress请求的时间以及CompressObject生成成功的时间都没有任何关系、

**回调安全**

在一期中，OSS回调机制并不包含校验机制，恶意用户可能伪造OSS的回调请求来回调您的回调服务，建议您在动态生成的回调地址中加上必要的校验信息来避免被恶意回调。

使用方式

依赖包：
```
  <dependency>
  <groupId>com.amazonaws</groupId>
  <artifactId>aws-java-sdk-s3</artifactId>
  <version>1.11.136</version>
  </dependency>
```

## 参考示例

http://oss.cn-north-1.jcloudcs.com/downloads/compress-object-example.zip
