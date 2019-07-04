# cancelKeyVersionDeletion


## 描述
取消删除指定版本密钥

## 请求方式
PATCH

## 请求地址
https://kms.jdcloud-api.com/v1/key/{keyId}/version/{version}:cancelDelete

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**keyId**|String|True| |密钥ID|
|**version**|String|True| |密钥版本|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|Not found|
