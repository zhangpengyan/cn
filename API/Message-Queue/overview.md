# 京东云jcq接口


## 简介
jcq相关接口</br>该产品当前支持使用访问控制产品进行用户身份管理和资源访问控制，详情请见：https://docs.jdcloud.com/cn/iam/support-services


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**addPermission**|POST|对当前topic授予目标用户特定权限|
|**cleanMessages**|POST|清除消息|
|**createSubscription**|POST|创建订阅|
|**createTopic**|POST|创建一个指定名称的topic|
|**deleteDeadLetters**|DELETE|删除死信消息|
|**deleteSubscription**|DELETE|删除订阅|
|**deleteTopic**|DELETE|删除单个topic|
|**describeAccessPoint**|GET|查看接入点接口|
|**describeConsumerGroupIds**|GET|consumerGroupId列表|
|**describeDeadLetterNumbers**|GET|死信消息数(按照用户或者consumerGroupId)|
|**describeDeadLetterNumbersWithTopic**|GET|死信消息数|
|**describeMessage**|GET|查询message详情|
|**describeMessages**|GET|消息列表|
|**describePermission**|GET|查看当前topic授予了哪些用户哪些权限|
|**describeSubscription**|GET|查询订阅详情|
|**describeSubscriptions**|GET|订阅列表|
|**describeTopic**|GET|查询topic详情|
|**describeTopics**|GET|查询topic列表|
|**listDeadLetters**|GET|死信队列列表|
|**removePermission**|DELETE|删除当前topic对目标用户授权的权限|
|**resendDeadLetters**|POST|重发死信消息|
|**resetConsumeOffset**|POST|重置消费位|
