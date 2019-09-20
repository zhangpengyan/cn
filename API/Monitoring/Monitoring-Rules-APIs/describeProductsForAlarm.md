# describeProductsForAlarm


## 描述
查询可用创建监控规则的产品列表

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v2/groupAlarms:products


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**serviceCode**|String|False| |产品线，从产品线维度筛选|
|**product**|String|False| |产品类型,从产品维度筛选、如redis2.8cluster\redis2.8instance。当serviceCode与product同时指定时，product优先级更高|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**productList**|Product[]| |
### Product
|名称|类型|描述|
|---|---|---|
|**dimensions**|Dimension[]|维度信息|
|**product**|String|产品标识|
|**productName**|String|产品名称|
|**serviceCode**|String|product对应的产品线|
|**tagServiceCode**|String|对应的标签服务serviceCode|
|**tags**|Object| |
### Dimension
|名称|类型|描述|
|---|---|---|
|**dimension**|String|维度|
|**dimensionName**|String|维度名称|
|**isNode**|Boolean|是否是子结点|
|**tagServiceCode**|String|对应标签服务的serviceCode|
|**tags**|Object|tags|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询可用于创建规则的product列表|
