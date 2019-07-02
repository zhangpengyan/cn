# batchDeleteDomainGroup


## 描述
批量删除域名组

## 请求方式
POST

## 请求地址
https://cdn.jdcloud-api.com/v1/domainGroup:batchDelete


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ids**|Long[]|True| |被删除的域名组id|


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
