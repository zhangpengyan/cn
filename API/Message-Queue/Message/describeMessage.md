# describeMessage


## 描述
查询message详情

## 请求方式
GET

## 请求地址
https://jcq.jdcloud-api.com/v1/regions/{regionId}/topics/{topicName}/messages/{messageId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**messageId**|String|True| |message Id|
|**regionId**|String|True| |所在区域的Region ID|
|**topicName**|String|True| |topic 名称|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**message**|Message|消息详情|
### Message
|名称|类型|描述|
|---|---|---|
|**body**|String|内容|
|**messageId**|String|消息id|
|**properties**|String|用户设置的属性json字符串|
|**storeTime**|Number|消息的存储时间|
|**tags**|String|tag以逗号隔开|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
