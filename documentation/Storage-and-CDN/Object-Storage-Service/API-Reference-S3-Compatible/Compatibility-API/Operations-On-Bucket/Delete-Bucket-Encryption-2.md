# DELETE Bucket encryption
 删除OSS存储空间的默认加密配置。此接口兼容S3,仅支持OSS的兼容S3服务域名。
参见[服务器域名](https://docs.jdcloud.com/cn/object-storage-service/regions-and-endpoints)。
 
## 请求语法
 
```HTTP
DELETE /?encryption HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: Wed, 06 Sep 2018 12:00:00 GMT
Authorization: authorization string  (使用签名版本4)

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
 
### 示例：

  请求示例：
  
```HTTP
DELETE /?encryption HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: Wed, 06 Sep 2018 12:00:00 GMT
Authorization: signatureValue   (使用签名版本4)

```

响应示例：
  
```HTTP
HTTP/1.1 200 OK
Server: JDCloudOSS
Date: Wed, 14 Nov 2018 03:48:31 GMT
Content-Length: 0
Connection: keep-alive
x-req-id: 9DD9D36C74E86398
x-amz-request-id: 9DD9D36C74E86398
```
