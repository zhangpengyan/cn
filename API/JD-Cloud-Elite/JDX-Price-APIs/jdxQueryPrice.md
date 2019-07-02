# jdxQueryPrice


## 描述
查询价格

## 请求方式
POST

## 请求地址
https://elite.cn-south-1.jdcloud-api.com/v1/regions/{regionId}/jdxQueryPrice

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**queryPriceParam**|QueryPriceParam|True| |查询价格参数|

### QueryPriceParam
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**cmd**|Integer|True| |操作类型 1:创建 2:续费 3:升降配|
|**packageCount**|Integer|True| |打包购买包数|
|**orderList**|OrderPriceProtocolVo[]|True| | |
### OrderPriceProtocolVo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**resourceId**|String|False| |资源id，续费和升降配时必传，其他非必传|
|**serviceCode**|String|True| |资源的类型，取值vm,disk,ip等，具体取值请在对接时联系我们|
|**region**|String|True| |资源所在区域，取值cn-north-1,cn-east-1,cn-east-2,cn-south-1|
|**billingType**|Integer|True| |计费类型，1:按配置 2:按用量 3:包年包月|
|**formula**|OrderResourceFormulaVo[]|False| |资源配置项列表|
|**count**|Integer|True| |资源数量|
|**timeSpan**|Integer|True| |资源使用时长|
|**timeUnit**|Integer|True| |资源使用时长类型，1:小时 2:天 3:月 4:年|
|**networkOperator**|Integer|True| |资源网络类型，0:无 1:non-BGP 2:BGP，当资源类型是ip时，则需要填写1或者2，其他资源类型填写0|
|**pin**|String|False| |用户pin，如有优惠用户，则填写优惠用户的pin，否则不用填写|
|**startTime**|String|True| |开始时间，格式：yyyy-MM-dd HH:mm:ss|
|**endTime**|String|False| |结束时间，格式：yyyy-MM-dd HH:mm:ss|
### OrderResourceFormulaVo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**key**|String|True| |资源配置项编码，具体取值请在对接时联系我们|
|**value**|Double|True| |资源配置项数量|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID，每次请求都不一样|

### Result
|名称|类型|描述|
|---|---|---|
|**status**|Boolean|true为成功，false为失败|
|**message**|String|描述信息|
|**data**|QueryPriceResultVo|查询数据结果|
### QueryPriceResultVo
|名称|类型|描述|
|---|---|---|
|**totalPrice**|Number|总金额，小数后2位精度|
|**totalPriceScale4**|Number|总金额，小数后4位精度|
|**discountedTotalPrice**|Number|折扣后总金额|
|**totalDiscount**|Number|折扣优惠金额|
|**totalOriginalPrice**|Number|订单原价|
|**remark**|String|备注|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**500**|Internal server error|
