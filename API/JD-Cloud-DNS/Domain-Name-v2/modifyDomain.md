# modifyDomain


## 描述
修改主域名

## 请求方式
PUT

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainName**|String|True| |需要修改的主域名，请使用describeDomains接口获取|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|此次请求的ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
