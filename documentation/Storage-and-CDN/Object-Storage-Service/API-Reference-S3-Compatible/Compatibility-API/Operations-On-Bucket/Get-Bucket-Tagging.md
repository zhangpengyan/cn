# GET Bucket tagging

## 描述

该操作可返回指定Bucket下设置的标签。

## 请求

### 语法

```HTTP
GET /?tagging HTTP/1.1
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
同Put Bucket tagging中请求元素

## 示例
### 请求示例
```HTTP
GET ?tagging HTTP/1.1
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

<Tagging>
  <TagSet>
     <Tag>
       <Key>Project</Key>
       <Value>Project One</Value>
     </Tag>
     <Tag>
       <Key>User</Key>
       <Value>jsmith</Value>
     </Tag>
  </TagSet>
</Tagging> 
```
