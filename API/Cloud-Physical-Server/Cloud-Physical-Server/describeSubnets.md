# describeSubnets


## 描述
查询子网列表

## 请求方式
GET

## 请求地址
https://cps.jdcloud-api.com/v1/regions/{regionId}/subnets

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeRegiones）获取云物理服务器支持的地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码；默认为1|
|**pageSize**|Integer|False|20|分页大小；默认为20；取值范围[20, 100]|
|**az**|String|False| |可用区，精确匹配|
|**name**|String|False| |子网名称|
|**vpcId**|String|False| |私有网络ID，精确匹配|
|**filters**|Filter[]|False| |subnetId - 子网ID，精确匹配，支持多个<br>|

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
|**subnets**|Subnet[]| |
|**pageNumber**|Integer|页码；默认为1|
|**pageSize**|Integer|分页大小；默认为20；取值范围[20, 100]|
|**totalCount**|Integer|查询结果总数|
### Subnet
|名称|类型|描述|
|---|---|---|
|**region**|String|地域代码, 如cn-east-1|
|**az**|String|可用区, 如cn-east-1a|
|**subnetId**|String|子网ID|
|**name**|String|子网名称|
|**cidr**|String|子网CIDR|
|**vpcId**|String|私有网络Id|
|**vpcName**|String|私有网络名称|
|**availableIpCount**|Integer|可用ip数量|
|**totalIpCount**|Integer|总ip数量|
|**networkType**|String|网络类型|
|**description**|String|描述|
|**createTime**|String|创建时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Bad request|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
