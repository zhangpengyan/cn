# modifyResourceRecordStatus


## 描述
启用、停用主域名下的解析记录

## 请求方式
PUT

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/ResourceRecord/{resourceRecordId}/status

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|
|**resourceRecordId**|String|True| |解析记录ID，请使用describeResourceRecord接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**action**|String|True| |要修改的状态，enable:启用 disable:停用|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|此次请求的ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
