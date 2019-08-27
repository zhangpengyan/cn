# deleteAg


## 描述
根据 id 删除高可用组，需确保 AG 中云主机实例已全部删除

## 请求方式
DELETE

## 请求地址
https://ag.jdcloud-api.com/v1/regions/{regionId}/availabilityGroups/{agId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域|
|**agId**|String|True| |高可用组 ID|

## 请求参数
无


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
