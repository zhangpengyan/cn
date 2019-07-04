# describeTopic


## 描述
查询topic详情

## 请求方式
GET

## 请求地址
https://jcq.jdcloud-api.com/v1/regions/{regionId}/topics/{topicName}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
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
|**topic**|Topic| |
### Topic
|名称|类型|描述|
|---|---|---|
|**authorizedPermission**|String|被授权的权限[PUB,SUB,PUBSUB,READ_ONLY,ADMIN]|
|**createTime**|String|创建时间|
|**description**|String|描述|
|**lastUpdateTime**|String|更新时间|
|**messageLifeTimeInHours**|Integer|消息生命周期时长小时|
|**own**|Boolean|是否是自己的topic|
|**subscriptionCount**|Integer|自己创建的订阅数|
|**tags**|Tag[]|标签信息|
|**topicConfig**|TopicConfig|配置信息|
|**topicId**|String|topic Id|
|**topicName**|String|topic名称|
|**topicStatus**|String|topicStatus|
### Tag
|名称|类型|描述|
|---|---|---|
|**key**|String|标签的键|
|**value**|String|标签的值|
### TopicConfig
|名称|类型|描述|
|---|---|---|
|**maxMessageSizeKB**|Integer|消息最大长度|
|**threshold**|Integer|tps|
|**topicPermission**|String|topicPermission|
|**topicType**|String|topicType|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
