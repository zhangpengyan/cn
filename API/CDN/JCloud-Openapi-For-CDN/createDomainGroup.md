# createDomainGroup


## 描述
创建域名组

## 请求方式
POST

## 请求地址
https://cdn.jdcloud-api.com/v1/domainGroup:create


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**shareCache**|String|False| |是否共享内存|
|**primaryDomain**|String|False| |主域名,开启共享缓存时必传|
|**domainGroupName**|String|False| |域名组名称|
|**domains**|String[]|False| |域名组内域名包含主域名|


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
