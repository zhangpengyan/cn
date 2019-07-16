# getRegions


## 描述
查询地域列表信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/regions

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
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
|**regions**|RegionInfo[]| |
### RegionInfo
|名称|类型|描述|
|---|---|---|
|**regionId**|String|地域 ID|
|**localName**|String|地域名称|
|**vendor**|String|供应商|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
