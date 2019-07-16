# jdxReportOrder


## 描述
上报订单

## 请求方式
POST

## 请求地址
https://elite.cn-south-1.jdcloud-api.com/v1/regions/{regionId}/jdxReportOrder

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**reportOrderInfo**|ReportOrderInfo|True| |上报订单信息|

### ReportOrderInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**orderNumber**|String|True| |订单号|
|**distributorAccount**|String|False| |经销商账号|
|**distributorName**|String|False| |经销商名称|
|**extraInfo**|String|False| |补充信息，填写当前订单的一些描述信息|

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

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**500**|Internal server error|
