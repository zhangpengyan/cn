# sendBatchMsg


## 描述
指定短信Id群发短信

## 请求方式
POST

## 请求地址
https://rms.jdcloud-api.com/v1/regions/{regionId}/sendBatchMsg

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**sendBatchMsgSpec**|SendBatchMsgSpec|True| |指定短信Id群发短信请求参数|

### SendBatchMsgSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**appId**|String|True| |应用Id|
|**messageId**|String|True| |短信Id|
|**phone**|String[]|True| |群发的国内电话号码,群发时一次最多不要超过100个手机号|
|**params**|String[]|False| |短信模板变量对应的数据值,Array格式|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求Id|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|SendBatchMsg|指定短信Id群发短信响应参数|
### SendBatchMsg
|名称|类型|描述|
|---|---|---|
|**status**|Boolean|请求状态|
|**code**|String|错误码|
|**message**|String|错误消息|
|**sequenceNumber**|String|本次发送请求的序列号|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|INVALID_ARGUMENT|
|**500**|INTERNAL|
