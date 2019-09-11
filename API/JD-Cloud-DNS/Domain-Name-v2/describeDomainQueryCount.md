# describeDomainQueryCount


## 描述
查看主域名的解析次数

## 请求方式
GET

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/queryCount

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainName**|String|True| |查询的主域名，请使用describeDomains接口获取|
|**start**|String|True| |查询时间段的起始时间, UTC时间格式，例如2017-11-10T23:00:00Z|
|**end**|String|True| |查询时间段的终止时间, UTC时间格式，例如2017-11-10T23:00:00Z|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|此次请求的ID|

### Result
|名称|类型|描述|
|---|---|---|
|**time**|Long[]|时间序列|
|**traffic**|Long[]|与时间序列对应的数据序列，单位：次数|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|NOT_FOUND|
