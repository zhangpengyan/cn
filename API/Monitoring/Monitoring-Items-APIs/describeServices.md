# describeServices


## 描述
概览页产品线信息接口

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v2/services


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**filters**|Filter[]|False| |服务码列表<br>filter name 为serviceCodes表示查询多个产品线的规则|
|**productType**|Long|False| |要查询的产品线类型   0：all    1：资源监控   2：其它   默认：1。若指定了查询的serviceCode，则忽略该参数|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| | |
|**values**|String[]|False| | |

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**services**|ServiceInfoV2[]| |
### ServiceInfoV2
|名称|类型|描述|
|---|---|---|
|**dimensions**|ChartDimension[]|产品线下的分组信息|
|**groupTree**|GroupTree| |
|**serviceCode**|String|产品线ServiceCode|
|**serviceName**|String|产品线名称|
### GroupTree
|名称|类型|描述|
|---|---|---|
|**childs**|GroupNode[]|分组groupCodes|
|**serviceCode**|String|serviceCode|
### GroupNode
|名称|类型|描述|
|---|---|---|
|**childs**|GroupNode[]|分组子节点|
|**groupCode**|String|分组groupCode|
|**parent**|String|分组父节点的groupCode|
### ChartDimension
|名称|类型|描述|
|---|---|---|
|**dimension**|String|分组groupCode|
|**dimensionName**|String|分组名称|
|**tags**|Object|分组下metric对应的tags|

## 返回码
|返回码|描述|
|---|---|
|**200**|查看各产品线service信息|
