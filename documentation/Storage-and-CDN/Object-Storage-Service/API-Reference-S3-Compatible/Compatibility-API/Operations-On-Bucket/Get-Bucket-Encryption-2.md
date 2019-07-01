# GET Bucket encryption
 返回用户对于OSS存储空间的默认加密配置。此接口兼容S3,仅支持OSS的兼容S3服务域名。
参见[服务器域名](https://docs.jdcloud.com/cn/object-storage-service/regions-and-endpoints)。
 
## 请求语法
 
```HTTP
GET /?encryption  HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: Wed, 06 Sep 2018 12:00:00 GMT
Authorization: authorization string  (使用签名版本4)
Content-Length:  0

```
###  请求参数

不需要请求参数。

###  请求头

不需要特殊请求头。

###  请求体

不需要请求体。

## 响应

### 响应头

 无特殊Header。
 
### 响应元素

|名称|描述|
|:-|:-|
|ApplyServerSideEncryptionByDefault|服务器端默认bucket加密方式的集合<br>子节点：SSEAlgorithm, KMSMasterKeyID<br>父节点：Rule|
|Rule|服务器端默认bucket加密方式的配置集合<br>子节点：ApplyServerSideEncryptionByDefault<br>父节点：ServerSideEncryptionConfiguration|
|ServerSideEncryptionConfiguration|服务器端默认bucket加密方式的具体配置集合<br>子节点：Rule<br>父节点：无|
|SSEAlgorithm|服务器端默认bucket的加密算法<br>有效值：aws:kms<br>限制：只能用于ApplyServerSideEncryptionByDefault之内<br>父节点：ApplyServerSideEncryptionByDefault|

 ### 特殊错误
  
  无特殊错误。
  
### 返回示例：
```HTTP
HTTP/1.1 200 OK
Server: JDCloudOSS
Date: Wed, 14 Nov 2018 03:50:32 GMT
Content-Type: text/xml;charset=UTF-8
Content-Length: 292
Connection: keep-alive
Vary: Accept-Encoding
x-req-id: 9DFB131D1820AD65
x-amz-request-id: 9DFB131D1820AD65

<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ServerSideEncryptionConfiguration>
    <Rule>
        <ApplyServerSideEncryptionByDefault>
            <SSEAlgorithm>aws:kms</SSEAlgorithm>
        </ApplyServerSideEncryptionByDefault>
     </Rule>
</ServerSideEncryptionConfiguration>

```
 
  
