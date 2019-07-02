# getRegionsAvailableZones


## 描述
查询可用域列表信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/regions_availableZones/{region}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**region**|String|True| |区域id|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**azs**|AzInfo[]| |
### AzInfo
|名称|类型|描述|
|---|---|---|
|**zoneId**|String|可用域 ID|
|**localName**|String|名称|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
