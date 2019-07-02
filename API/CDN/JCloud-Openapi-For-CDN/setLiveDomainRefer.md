# setLiveDomainRefer


## 描述
设置域名refer防盗链

## 请求方式
POST

## 请求地址
https://cdn.jdcloud-api.com/v1/liveDomain/{domain}/refer

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domain**|String|True| |用户域名|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**referType**|String|False| |refer类型，取值：block（黑名单），allow（白名单）默认为block|
|**referList**|String[]|False| |逗号隔开的域名列表，如果referList传空则为删除|
|**allowNoReferHeader**|String|False| |是否允许空refer访问，默认为“on”|
|**allowNullReferHeader**|String|False| |是否允许无ua访问，默认为“on”|


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
