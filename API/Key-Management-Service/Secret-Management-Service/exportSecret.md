# exportSecret


## 描述
导出机密

## 请求方式
GET

## 请求地址
https://kms.jdcloud-api.com/v1/secret/{secretId}:export

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**secretId**|String|True| |机密ID|

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
|**secretPackage**|String|机密包|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|Not found|
