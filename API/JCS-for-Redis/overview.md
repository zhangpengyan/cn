# JDCloud Redis API


## 简介
京东云缓存Redis相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**createCacheInstance**|POST|创建一个指定配置的缓存Redis实例：可选择主从版或集群版，每种类型又分为多种规格（按CPU核数、内存容量、磁盘容量、带宽等划分），具体可参考产品规格代码，https://docs.jdcloud.com/cn/jcs-for-redis/specifications<br>|
|**deleteCacheInstance**|DELETE|删除按配置计费、或包年包月已到期的缓存Redis实例，包年包月未到期不可删除。<br>只有处于运行running或者错误error状态才可以删除，其余状态不可以删除。<br>白名单用户不能删除包年包月已到期的缓存Redis实例。<br>|
|**describeCacheInstance**|GET|查询缓存Redis实例的详细信息|
|**describeCacheInstances**|GET|查询缓存Redis实例列表，可分页、可排序、可搜索、可过滤|
|**describeInstanceClass**|GET|查询某区域下的缓存Redis实例规格列表|
|**describeUserQuota**|GET|查询账户的缓存Redis配额信息|
|**modifyCacheInstanceAttribute**|PATCH|修改缓存Redis实例的资源名称或描述，二者至少选一|
|**modifyCacheInstanceClass**|POST|变更缓存Redis实例规格（变配），只能变更运行状态的实例规格，变更的规格不能与之前的相同。<br>预付费用户，从集群版变配到主从版，新规格的内存大小要大于老规格的内存大小，从主从版到集群版，新规格的内存大小要不小于老规格的内存大小。<br>|
|**resetCacheInstancePassword**|POST|重置缓存Redis实例的密码，可为空|
