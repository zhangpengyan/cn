# updateDomainGroup


## 描述
更新域名组

## 请求方式
POST

## 请求地址
https://cdn.jdcloud-api.com/v1/domainGroup/{id}:update

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|Long|True| |域名组id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domains**|String[]|False| |域名组内域名，包含主域名|
|**primaryDomain**|String|False| |主域名,开启共享缓存时必传|
|**shareCache**|String|False| |是否共享内存|
|**domainGroupName**|String|False| | |


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
