# listProductAbilities


## 描述
查看产品功能列表接口

## 请求方式
GET

## 请求地址
https://iotcore.jdcloud-api.com/v2/regions/{regionId}/instances/{instanceId}/products/{productKey}/abilities

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**instanceId**|String|True| |IoT Hub实例ID信息|
|**productKey**|String|True| |产品Key|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码, 默认为1, 取值范围：[1,∞)|
|**pageSize**|Integer|False|10|分页大小，默认为10，取值范围：[10,100]|
|**filters**|Filter[]|False| |abilityName-功能名称，精确匹配<br>abilityType-功能类型，精确匹配<br>|

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
|**page**|PageinfoVO|分页信息|
|**abilities**|ProductAbility[]|产品详情|
### ProductAbility
|名称|类型|描述|
|---|---|---|
|**abilityId**|String|功能唯一标识|
|**abilityName**|String|名称|
|**abilityType**|Integer|类型,0:属性,1:事件,2:服务|
|**abilityDescription**|String|描述|
|**accessMode**|String|读写性,read_only:只读,read_write:读写|
|**abilityDataType**|String|数据类型|
|**abilityDataSpec**|String|数据定义|
|**customized**|Boolean|是否为自定义功能,false:否,true:是|
|**createdTime**|Long|创建时间,时间为东八区(UTC/GMT+08:00)|
### PageinfoVO
|名称|类型|描述|
|---|---|---|
|**pageSize**|Integer|每页显示条数|
|**nowPage**|Integer|当前页数|
|**totalSize**|Integer|总记录数|
|**totalPage**|Integer|总页数|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
