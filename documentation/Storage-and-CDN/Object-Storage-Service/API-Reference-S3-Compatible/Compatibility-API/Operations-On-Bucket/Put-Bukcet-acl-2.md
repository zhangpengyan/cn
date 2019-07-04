# Put Bucket acl

## 描述
该操作可指定Bucket的访问控制列表（acl）。
目前Bucket有三种访问权限：private、public-read、public-read-write。Put Bucket ACL操作通过Put请求中的“x-amz-acl”头来设置。
这个操作只有该Bucket的创建者有权限执行。如果操作成功，则返回200；否则返回相应的错误码和提示信息。

## 请求
### 语法
```HTTP
PUT /?acl HTTP/1.1
x-amz-acl：<Permission>
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))

```
### 请求参数
无请求参数
### 请求Header
除公共请求Header外，您还可以使用以下Header：

通过Header您可以使用以下方法设置访问权限：
* 指定固定的ACL
OSS支持一组预定义的ACL（固定ACL），每种固定ACL都有一组预定义的被授权者和权限。要使用固定ACL设置访问权限，请使用以下Header，并将固定ACL名称指定（默认私有读写private）。

名称|描述|必须
---|---|---
x-amz-acl|指定固定ACL设置Bucket的ACL。<br>Type: String<br>Valid Values: private、public-read、public-read-write<br>Default: private|否

若您想明确指定每个被授权者的权限请使用[put Bukcet policy](https://docs.jdcloud.com/cn/object-storage-service/put-bucket-policy-2) 
完成细粒度授权。


### 请求示例
```HTTP
PUT /?acl HTTP/1.1
x-amz-acl：public-read
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))

```
### 响应示例

```HTTP
HTTP/1.1 200 OK
x-amz-request-id: 656c76696e672SAMPLE5657374  
Date: Tue, 04 Apr 2017 20:34:56 GMT  
Connection: keep-alive  
Server: JDCloudOSS

```




