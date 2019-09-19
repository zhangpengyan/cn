# reply


## 描述
短信回复接口

## 请求方式
POST

## 请求地址
https://sms.jdcloud-api.com/v1/regions/{regionId}/reply

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True|cn-north-1|Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**appId**|String|True| |应用Id|
|**dataDate**|String|True| |查询时间|
|**phoneList**|String[]|False| |手机号列表（选填）|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**data**|ReplyResp[]|拉取单个手机短信状态响应参数|
|**status**|Boolean|请求状态|
|**code**|String|错误码|
|**message**|String|错误消息|
### ReplyResp
|名称|类型|描述|
|---|---|---|
|**appId**|String|应用Id|
|**signId**|String|签名Id|
|**phoneNum**|String|手机号|
|**dataTime**|String|回复时间（yyyy-MM-dd HH:mm:ss)|
|**content**|String|回复内容|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|INVALID_ARGUMENT|
|**500**|INTERNAL|
