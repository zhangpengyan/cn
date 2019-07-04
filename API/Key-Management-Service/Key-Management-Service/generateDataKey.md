# generateDataKey


## 描述
从KMS中获取一对数据密钥的明文/密文

## 请求方式
GET

## 请求地址
https://kms.jdcloud-api.com/v1/key/{keyId}:GenerateDataKey

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**keyId**|String|True| |密钥ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**ciphertextBlob**|String|密文DEK Base64-encoded binary data object|
|**plaintext**|String|明文DEK Base64-encoded binary data object|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|Not found|
