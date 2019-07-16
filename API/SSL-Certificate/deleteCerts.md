# deleteCerts


## 描述
删除证书<br>敏感操作，可开启<a href="https://docs.jdcloud.com/cn/security-operation-protection/operation-protection">MFA操作保护</a>

## 请求方式
DELETE

## 请求地址
https://ssl.jdcloud-api.com/v1/sslCert/{certId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**certId**|String|True| |证书 Id|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识Id|

### Result
|名称|类型|描述|
|---|---|---|
|**code**|Integer|状态码|
|**message**|String|消息|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
