# PUT  Bucket encryption
 该功能用于设定bucket默认加密方式。仅支持SSE-KMS。
 参见[服务器域名](https://docs.jdcloud.com/cn/object-storage-service/regions-and-endpoints)。
 
## 请求语法
 
```HTTP
PUT /?encryption  HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: Wed, 06 Sep 2018 12:00:00 GMT
Authorization: authorization string  (使用签名版本4)
Content-Length:  length 

default encryption configuration in the request body

```
###  请求参数

不需要请求参数。

###  请求头

不需要特殊请求头。

###  请求体
加密方式信息存在request body中，以xml的形式展现。下面的例子展示了设置bucket默认为SSE-KMS。

```XML
<ServerSideEncryptionConfiguration>
  <Rule>
    <ApplyServerSideEncryptionByDefault>
            <SSEAlgorithm>aws:kms</SSEAlgorithm>
    </ApplyServerSideEncryptionByDefault>
  </Rule>
</ServerSideEncryptionConfiguration>

```

### 加密设置XML 元素描述

|名称|描述|是否必须|
|:-|:-|:-|
|ApplyServerSideEncryptionByDefault|服务器端默认bucket加密方式的集合<br>子节点：SSEAlgorithm, KMSMasterKeyID<br>父节点：Rule|是|
|Rule|服务器端默认bucket加密方式的配置集合<br>子节点：ApplyServerSideEncryptionByDefault<br>父节点：ServerSideEncryptionConfiguration|是|
|ServerSideEncryptionConfiguration|服务器端默认bucket加密方式的具体配置集合<br>子节点：Rule<br>父节点：无|是|
|SSEAlgorithm|服务器端默认bucket的加密算法<br>有效值：aws:kms<br>限制：只能用于ApplyServerSideEncryptionByDefault之内<br>父节点：ApplyServerSideEncryptionByDefault|是|

## 响应

### 响应头

 无特殊Header。
 
### 响应元素

 无响应元素。

 ### 特殊错误
  
  无特殊错误。
  
## 示例：

请求示例：
```HTTP
PUT /?encryption HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: Wed, 06 Sep 2017 12:00:00 GMT
Authorization: authorization string
Content-Length: length

<ServerSideEncryptionConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/" >
  <Rule>
    <ApplyServerSideEncryptionByDefault>
        <SSEAlgorithm>aws:kms</SSEAlgorithm>
    </ApplyServerSideEncryptionByDefault>
  </Rule>
</ServerSideEncryptionConfiguration>

  ```
 返回示例：
 
```HTTP
HTTP/1.1 200 OK
Server: JDCloudOSS
Date: Wed, 14 Nov 2018 03:50:29 GMT
Content-Length: 0
Connection: keep-alive
x-req-id: A8D4BE3AD5D9B626
x-amz-request-id: A8D4BE3AD5D9B626
```
  
 
  
  
  
  


