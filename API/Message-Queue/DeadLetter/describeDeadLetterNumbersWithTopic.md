# describeDeadLetterNumbersWithTopic


## 描述
死信消息数

## 请求方式
GET

## 请求地址
https://jcq.jdcloud-api.com/v1/regions/{regionId}/topics/{topicName}/deadLetterNumbers

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |所在区域的Region ID|
|**topicName**|String|True| |topic 名称|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**consumerGroupId**|String|False| |consumerGroupId为空则显示该Topic下所有订阅关系里的死信数量|
|**pageNumber**|Integer|False| |页码|
|**pageSize**|Integer|False| |每页数|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**deadLetterNumbers**|DeadLetterNumber[]| |
|**totalCount**|Integer|总数|
### DeadLetterNumber
|名称|类型|描述|
|---|---|---|
|**consumerGroupId**|String|consumerGroupId|
|**deadLetterNumber**|Integer|死信队列数|
|**topicId**|String|topic的编号|
|**topicName**|String|topic名称|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
