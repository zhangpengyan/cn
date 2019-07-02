# describeSubscriptions


## 描述
订阅列表

## 请求方式
GET

## 请求地址
https://jcq.jdcloud-api.com/v1/regions/{regionId}/topics/{topicName}/subscriptions

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |所在区域的Region ID|
|**topicName**|String|True| |topic 名称|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**consumerGroupFilter**|String|False| |consumerGroupFilter，consumerGroupId的过滤条件|
|**pageNumber**|Integer|False| |分页之中的页码|
|**pageSize**|Integer|False| |分页之中的每页大小|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**subscriptions**|Subscription[]| |
|**totalCount**|Integer|订阅关系的总数|
### Subscription
|名称|类型|描述|
|---|---|---|
|**consumerGroupId**|String|consumerGroupId|
|**consumerNumbers**|Integer|在线consumer个数|
|**createTime**|String|创建时间|
|**dlqEnable**|Boolean|是否开启死信队列|
|**endPoint**|String|endPoint|
|**lastUpdateTime**|String|最后更新时间|
|**maxRetryTimes**|Integer|最大重试次数|
|**messageInvisibleTimeInSeconds**|Integer|messageInvisibleTimeInSeconds|
|**subscriptionType**|String|subscriptionType|
|**tags**|String[]|tags|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
