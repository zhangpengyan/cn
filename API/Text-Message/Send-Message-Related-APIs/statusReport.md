# statusReport


## 描述
短信发送回执接口

## 请求方式
POST

## 请求地址
https://sms.jdcloud-api.com/v1/regions/{regionId}/statusReport

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True|cn-north-1|Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**sequenceNumber**|String|True| |发送短信的序列号|
|**phoneList**|String[]|False| |需要获取回执的手机号码列表，选填|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**data**|StatusReportResp[]|拉取单个手机短信状态响应参数|
|**status**|Boolean|请求状态|
|**code**|String|错误码|
|**message**|String|错误消息|
### StatusReportResp
|名称|类型|描述|
|---|---|---|
|**phoneNum**|String|手机号|
|**sequenceNumber**|String|发送短信的序列号|
|**sendTime**|String|短信发送时间（yyyy-MM-dd HH:mm:ss)|
|**reportTime**|String|接收到回执的时间（yyyy-MM-dd HH:mm:ss)|
|**status**|Integer|发送状态|
|**code**|String|错误码|
|**splitNum**|Integer|长短信拆分序号（短短信直接返回1)|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|INVALID_ARGUMENT|
|**500**|INTERNAL|
