# describeMessages


## 描述
消息列表

## 请求方式
GET

## 请求地址
https://jcq.jdcloud-api.com/v1/regions/{regionId}/topics/{topicName}/messages

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |所在区域的Region ID|
|**topicName**|String|True| |topic 名称|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**endTime**|String|True| |结束时间|
|**startTime**|String|True| |开始时间|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**messages**|Message[]| |
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
