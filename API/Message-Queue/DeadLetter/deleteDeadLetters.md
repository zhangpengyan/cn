# deleteDeadLetters


## 描述
删除死信消息

## 请求方式
DELETE

## 请求地址
https://jcq.jdcloud-api.com/v1/regions/{regionId}/topics/{topicName}/subscriptions/{consumerGroupId}:deleteDeadLetters

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**consumerGroupId**|String|True| |consumerGroupId|
|**regionId**|String|True| |所在区域的Region ID|
|**topicName**|String|True| |topic 名称|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**messageIds**|String|False| |messageIds,多个逗号隔开，不传该值就是删除所有的死信|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**messageIds**|String[]| |

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
