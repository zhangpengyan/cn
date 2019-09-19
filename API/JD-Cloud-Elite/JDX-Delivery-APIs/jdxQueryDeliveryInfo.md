# jdxQueryDeliveryInfo


## 描述
查询交付信息接口

## 请求方式
GET

## 请求地址
https://elite.cn-south-1.jdcloud-api.com/v1/regions/{regionId}/jdxQueryDeliveryInfo

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**orderNumber**|String|True| |订单号|


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
|**data**|QueryDeliveryInfoResultVo|查询数据结果|
### QueryDeliveryInfoResultVo
|名称|类型|描述|
|---|---|---|
|**remark**|String|交付信息|
|**effectiveDt**|String|生效时间，格式：yyyy-MM-dd HH:mm:ss|
|**failureDt**|String|失效时间，格式：yyyy-MM-dd HH:mm:ss|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**500**|Internal server error|
