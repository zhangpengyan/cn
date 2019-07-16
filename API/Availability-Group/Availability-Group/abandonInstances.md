# abandonInstances


## 描述
从高可用组中剔除实例

## 请求方式
POST

## 请求地址
https://ag.jdcloud-api.com/v1/regions/{regionId}/availabilityGroups/{agId}:abandonInstances

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域|
|**agId**|String|True| |高可用组 ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instanceIds**|String[]|True| |准备剔除出高可用组的实例 id|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
