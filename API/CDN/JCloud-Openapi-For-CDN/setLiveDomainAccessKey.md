# setLiveDomainAccessKey


## 描述
设置URL鉴权

## 请求方式
POST

## 请求地址
https://cdn.jdcloud-api.com/v1/liveDomain/{domain}/accesskeyConfig

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domain**|String|True| |用户域名|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**accesskeyType**|Integer|False| |url鉴权开启1关闭0|
|**accesskeyKey**|String|False| |url鉴权开启时必传|
|**authLifeTime**|Integer|False| |开启时默认值为300s,关闭时为0|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Object| |
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
