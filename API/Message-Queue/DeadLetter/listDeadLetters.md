# listDeadLetters


## 描述
死信队列列表

## 请求方式
GET

## 请求地址
https://jcq.jdcloud-api.com/v1/regions/{regionId}/topics/{topicName}/subscriptions/{consumerGroupId}:listDeadLetters

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**consumerGroupId**|String|True| |consumerGroupId|
|**regionId**|String|True| |所在区域的Region ID|
|**topicName**|String|True| |topic 名称|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**endTime**|String|True| |结束时间|
|**pageNumber**|Integer|False| |页码；默认为1|
|**pageSize**|Integer|False| |分页大小；默认为20；取值范围[10, 100]|
|**startTime**|String|True| |开始时间|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**deadLetters**|DeadLetter[]| |
|**totalCount**|Integer|总数|
### DeadLetter
|名称|类型|描述|
|---|---|---|
|**expireTime**|String|过期时间|
|**messageId**|String|id|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
