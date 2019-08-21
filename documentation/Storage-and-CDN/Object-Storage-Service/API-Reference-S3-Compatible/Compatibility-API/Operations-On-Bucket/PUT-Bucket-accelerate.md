# PUT Bucket accelerate

## 描述

该操作可为已存在的Bucket设置加速，支持开启和暂停。

## 请求
### 语法
```HTTP
PUT /?accelerate HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Content-Length: length
Date: date
Authorization: authorization string
 
<AccelerateConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/"> 
  <Status>transfer acceleration state</Status> 
</AccelerateConfiguration>
```

### 请求参数

无请求参数

### 请求Header

无特殊请求Header

### 请求元素

名称|描述|必须
---|---|---
AccelerateConfiguration|加速状态设置的集合。<br>类型：Container<br>子标签: Status|是
Status|加速状态<br>Type: Enum<br>有效值: Enabled、Suspended<br>父标签: AccelerateConfiguration|是

## 响应
### 响应Header
无特殊响应Header
### 响应元素
无响应元素
### 特殊错误

HTTP Status Code|Error Code|Error Meaasge|描述
-|-|-|-
400|MalformedXML|The XML you provided was not well-formed or did not validate against our published schema|请求XML不合法
403|AccessForbidden|put accelerate failed, please open cdn service first|未开通CDN服务

## 示例
### 请求示例
```HTTP
PUT /?accelerate HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: Mon, 11 Apr 2016 12:00:00 GMT
Authorization: authorization string
Content-Type: text/plain
Content-Length: length
 
<AccelerateConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/"> 
  <Status>Enabled</Status> 
</AccelerateConfiguration>
```
### 响应示例
```HTTP
HTTP/1.1 200 OK
x-amz-request-id: 9E26D08072A8EF9E
Date: Wed, 14 May 2014 02:11:22 GMT
Content-Length: 0
Server: JDCloudOSS
```







