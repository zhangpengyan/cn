# 高可用组


## 简介
高可用组相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**abandonInstances**|POST|从高可用组中剔除实例|
|**createAg**|POST|创建一个高可用组|
|**deleteAg**|DELETE|根据 id 删除高可用组，需确保 AG 中云主机实例已全部删除|
|**describeAg**|GET|根据 id 查询高可用组详情|
|**describeAgs**|GET|使用过滤条件查询一个或多个高可用组|
|**describeQuotas**|GET|查询(ag)配额|
|**setInstanceTemplate**|POST|修改高可用组的实例模板|
|**updateAg**|PATCH|修改一个高可用组的信息|
