# setUserAgentConfig


## 描述
设置userAgent信息

## 请求方式
POST

## 请求地址
https://cdn.jdcloud-api.com/v1/domain/{domain}/userAgentConfig

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domain**|String|True| |用户域名|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**userAgentType**|String|False| |userAgent类型,取值：block（黑名单）,allow（白名单）,默认为block|
|**userAgentList**|String[]|False| |UA列表,如果userAgentList为空,则为全部删除|


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
