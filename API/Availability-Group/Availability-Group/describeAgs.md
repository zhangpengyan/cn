# describeAgs


## 描述
使用过滤条件查询一个或多个高可用组

## 请求方式
GET

## 请求地址
https://ag.jdcloud-api.com/v1/regions/{regionId}/availabilityGroups

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False| |页码；默认为1|
|**pageSize**|Integer|False| |分页大小；默认为20；取值范围[10, 100]|
|**filters**|Filter[]|False| |agName - ag名字，支持模糊匹配<br>agId - ag id，精确匹配<br>instanceTemplateId - 实例模板id，精确匹配<br>vpcId - vpc id，精确匹配<br>|

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
|**ags**|AvailabilityGroup[]| |
|**totalCount**|Integer| |
### AvailabilityGroup
|名称|类型|描述|
|---|---|---|
|**id**|String|可用组id|
|**name**|String|可用组name|
|**description**|String|描述，length:0-256|
|**instanceTemplateId**|String|实例模板的Id|
|**azs**|String[]|可用区域|
|**agType**|String|可用组类型，支持vm|
|**createTime**|String|创建时间|
|**count**|Number|可用组中实例的数量|
|**autoScaling**|Boolean|是否开启自动伸缩|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
