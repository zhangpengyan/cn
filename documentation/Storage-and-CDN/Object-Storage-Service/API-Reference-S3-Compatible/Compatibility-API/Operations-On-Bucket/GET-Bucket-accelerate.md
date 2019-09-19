# GET Bucket accelerate

## 描述

该操作可返回指定Bucket下的传输加速规则。该Get操作有以下响应：

- 若某个Bucket的传输加速状态为Enabled，则响应为：
```XML
<AccelerateConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Status>Enabled</Status>
</AccelerateConfiguration>
```

- 若某个Bucket的传输加速状态为Suspended，则响应为：
```XML
<AccelerateConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Status>Suspended</Status>
</AccelerateConfiguration>
```

- 若某个Bucket从未设置传输加速，则响应为：
```XML
<AccelerateConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/"/>
```

## 请求

### 语法

```HTTP
GET /?accelerate HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Content-Length: length
Date: date
Authorization: authorization string
```

### 请求参数
无请求参数
### 请求Header
无特殊请求Header
### 请求元素
无请求元素

## 响应
### 响应Header
无特殊响应Header
### 响应元素
同Put Bucket accelerate中请求元素

## 示例
### 请求示例
```HTTP
GET /?accelerate HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Content-Length: length
Date: date
Authorization: authorization string
```
### 响应示例
```HTTP
HTTP/1.1 200 OK
x-amz-request-id: 51991C342C575321
Date: Thu, 15 Nov 2012 00:17:23 GMT
Server: JDCloudOSS
Content-Length: length

<AccelerateConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Status>Enabled</Status>
</AccelerateConfiguration>
```
