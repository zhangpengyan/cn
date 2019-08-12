# describeMonitorTarget


## 描述
查询子域名的可用监控对象

## 请求方式
GET

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/monitorTarget

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**subDomainName**|String|True| |子域名|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|此次请求的ID|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|String[]|返回的可用监控对象的数组|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
