# Get Bucket Lifecycle

## 描述

该操作可返回指定Bucket下的生命周期规则。

## 请求

### 语法

```HTTP
GET /?lifecycle HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
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
同PUT Bucket Lifecycle中请求元素

## 示例
### 请求示例
```HTTP
GET /?lifecycle HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
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

<?xml version="1.0" encoding="UTF-8"?>
<LifecycleConfiguration>
    <Rule>
        <ID>delete rule</ID>
        <Filter>
           <Prefix>projectdocs/</Prefix>
        </Filter>
        <Status>Enabled</Status>
        <Expiration>
           <Days>3650</Days>
        </Expiration>
    </Rule>
</LifecycleConfiguration>
```
