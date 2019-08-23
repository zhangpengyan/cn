# jdxCreateOrder


## 描述
下单接口

## 请求方式
POST

## 请求地址
https://elite.cn-south-1.jdcloud-api.com/v1/regions/{regionId}/jdxCreateOrder

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**createOrderInfo**|CreateOrderInfo|True| |下单信息|

### CreateOrderInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**productId**|Integer|True| |spu ID|
|**skuId**|Integer|True| |sku ID|
|**buyNum**|Integer|True| |购买数量|
|**remark**|String|False| |备注|
|**cartExtraChargeVos**|CartExtraChargeVo[]|False| |额外计费项信息|
### CartExtraChargeVo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |额外计费项名称|
|**buyNum**|Integer|False| |购买数量|

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
|**data**|CreateOrderResultVo|下单后生成的订单号|
### CreateOrderResultVo
|名称|类型|描述|
|---|---|---|
|**orderNumber**|String|订单号|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**500**|Internal server error|
