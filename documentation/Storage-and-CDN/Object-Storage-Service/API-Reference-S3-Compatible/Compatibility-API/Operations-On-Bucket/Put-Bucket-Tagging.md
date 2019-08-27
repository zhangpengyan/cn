# PUT Bucket tagging

## 描述

该操作支持为已存在的Bucket设置标签（Tag）。

## 请求
### 语法
```HTTP
PUT /?tagging HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: date
Authorization: authorization string
Content-MD5: MD5
 
<Tagging>
  <TagSet>
     <Tag>
       <Key>Tag Name</Key>
       <Value>Tag Value</Value>
     </Tag>
  </TagSet>
</Tagging>
```

### 请求参数

无请求参数

### 请求Header

无特殊请求Header

### 请求元素

名称|描述|必须
---|---|---
Tagging|TagSet和Tag元素容器<br>类型：String|是
TagSet|一系列Tag元素容器<br>类型：Container<br>父标签：Tagging|是
Tag|一组Tag的容器<br>类型：Container<br>父标签：TagSet|是
Key|Tag键<br>类型：String<br>父标签：Tag|是
Value|Tag值<br>类型：String<br>父标签：Tag|是

## 响应
### 响应Header
无特殊响应Header
### 响应元素
无响应元素

## 示例
### 请求示例
```HTTP
PUT ?tagging HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Content-Length: 1660
x-amz-date: Thu, 12 Apr 2012 20:04:21 GMT
Authorization: authorization string

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
### 响应示例
```HTTP
HTTP/1.1 200 OK
x-amz-request-id: 9E26D08072A8EF9E
Date: Wed, 14 May 2014 02:11:22 GMT
Content-Length: 0
Server: JDCloudOSS
```







