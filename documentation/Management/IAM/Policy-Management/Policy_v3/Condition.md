# 条件描述方式

条件是由条件运算符，条件键和条件值三部分组成，Condition中可包含多个条件

## 条件间的关系

 - 同一个条件键中的多个值之间是“或”关系，在检查条件时，只要满足其中的一个值及判断条件满足
 - 不同条件键之间是“且”关系，在检查条件时，所有的条件键都必须同时满足，才能判断条件满足。

## 目前支持的条件运算符

|  类型| 条件运算符|说明|
|:----------:|:-----------------:|:-----------------:|
|  字符串运算符  |  StringEquals |字符串等于（区分大小写）|

## 目前支持的全局条件键

 | 名称 |描述 |支持的运算符 |
| :----------------- |:---------- | :----------------- |
 |Jdcloud:RequestTag/tag-key|格式为 "Jdcloud:RequestTag/tag-key":"tag-value"<Br>其中 tag-key 和 tag-value 是标签键值对|字符串运算符|
 
 ## 目前支持指定标签条件键的产品线
 
给资源打上对应的标签后，创建策略时您可以通过指定特定标签条件的方式批量指定资源，而无需逐个输入资源ID。

  | 产品线名称  | 资源ID|
| :-----------------:|:-----------------: |
 |云硬盘|DiskID|
  |Kubernetes|NodeGroupID|
| 原生容器  | ContainerID  |
 | Pod  | PodID  |
  |云文件服务 | FileSystemID  |
 |  云缓存Redis | CacheInstanceID  |
|  云缓存Memcached | InstanceID  |
|  云数据库RDS | InstanceID  |
 |  云数据库MongoDB | InstanceID  |
|  分布式数据库DRDS|  InstanceID |
|  CDN | DomainName|
| 消息队列  |TopicName   |
| 队列服务  | QueueID  |
|  云搜索 | InstanceID  |
