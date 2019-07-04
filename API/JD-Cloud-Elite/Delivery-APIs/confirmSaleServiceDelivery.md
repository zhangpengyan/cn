# confirmSaleServiceDelivery


## 描述
确认交付

## 请求方式
POST

## 请求地址
https://elite.cn-south-1.jdcloud-api.com/v1/regions/{regionId}/confirmSaleServiceDelivery

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**confirmDeliveryInfo**|ConfirmDeliveryInfo|True| |交付信息|

### ConfirmDeliveryInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**deliverNumber**|String|False| |交付单号|
|**remark**|String|False| |交付单备注，填写交付时的信息，比如网址，账号等|

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
