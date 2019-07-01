# enableSecretVersion


## 描述
启用指定版本机密

## 请求方式
PATCH

## 请求地址
https://kms.jdcloud-api.com/v1/secret/{secretId}/version/{version}:enable

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**secretId**|String|True| |机密ID|
|**version**|String|True| |机密版本|

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
