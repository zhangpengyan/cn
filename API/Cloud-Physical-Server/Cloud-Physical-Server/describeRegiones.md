# describeRegiones


## 描述
查询云物理服务器地域列表

## 请求方式
GET

## 请求地址
https://cps.jdcloud-api.com/v1/regions


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**networkType**|String|False| |网络类型basic/vpc, 默认basic|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**regions**|Region[]| |
### Region
|名称|类型|描述|
|---|---|---|
|**region**|String|地域代码, 如 cn-east-1|
|**regionName**|String|地域名称，如 华东一区|
|**azs**|Az[]|可用区列表|
### Az
|名称|类型|描述|
|---|---|---|
|**region**|String|地域代码，如 cn-east-1|
|**az**|String|可用区代码，如 cn-east-1a|
|**azName**|String|可用区名称|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Bad request|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
