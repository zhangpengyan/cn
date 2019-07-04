# describeQuotas


## 描述
查询(ag)配额

## 请求方式
GET

## 请求地址
https://ag.jdcloud-api.com/v1/regions/{regionId}/quotas

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**filters**|Filter[]|False| |resourceTypes - 资源类型，暂时只支持[ag]<br>|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**quotas**|Quota[]|配额列表|
### Quota
|名称|类型|描述|
|---|---|---|
|**resourceType**|String|资源类型[ag]|
|**limit**|Integer|配额上限|
|**used**|Integer|已用配额|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
