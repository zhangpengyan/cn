# setAccesskeyConfig


## 描述
设置url鉴权

## 请求方式
POST

## 请求地址
https://cdn.jdcloud-api.com/v1/domain/{domain}/accesskeyConfig

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domain**|String|True| |用户域名|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**accesskeyType**|Integer|False| |鉴权类型，0表示无鉴权，1表示参数鉴权，2表示路径鉴权|
|**accesskeyKey**|String|False| |密码，长度为8到32|
|**accesskeyKeep**|Integer|False| |是否是回源鉴权 0表示是 1表示否|


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
