# GET Bucket Location

## 描述

该操作可返回指定Bucket所在的区域。

## 请求

### 语法

```HTTP
GET /?location HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: date
Authorization: authorization string (see Authenticating Requests (AWS Signature Version4))
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

名称|描述
-|-
LocationConstraint|Bucket所在的区域。<br>Type: String<br>Valid Values: huabei \| suqian \| guangzhou \| shanghai

注：

- 目前LocationConstraint对应的有效值为：huabei（华北-北京），suqian（华东-宿迁），shanghai（华东-上海），guangzhou（华南-广州）

- 未来该API将进行升级，LocationConstraint对应的有效值将修改为：cn-north-1（华北-北京），cn-east-1（华东-宿迁），cn-east-2（华东-上海），cn-south-1（华南-广州）

- 如您在调用该API时需要解析LocationConstraint的话，请在应用层进行兼容，例如将`huabei`与`cn-north-1`进行等效兼容。API升级后，您无须修改代码即可平滑过渡。

### 特殊错误
无特殊错误

## 示例
### 请求示例

```HTTP
GET /?location HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: Tue, 09 Oct 2007 20:26:04 +0000
Authorization: signatureValue
```

### 响应示例

```XML
<?xml version="1.0" encoding="UTF-8"?>
<LocationConstraint>huabei</LocationConstraint>
```
