# 对象存储API


## 简介
对象存储API，主要包含查询Bucket列表，创建Bucket, 删除Bucket，查询Bucket是否存在；镜像回源API，主要包含添加镜像回源配置，获取镜像回源配置和删除镜像回源配置。更多API见：https://docs.jdcloud.com/en/object-storage-service/compatibility-api-overview


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**deleteBackSourceConfiguration**|DELETE|删除回源配置(ossopenapi)|
|**deleteBucket**|DELETE|删除一个bucket(oss)</br>|
|**getBackSourceConfiguration**|GET|获取回源配置(ossopenapi)|
|**headBucket**|HEAD|查询bucket是否存在(oss)</br>|
|**listBuckets**|GET|列出当前用户的所有bucket(oss)</br>|
|**putBackSourceConfiguration**|PUT|添加修改回源配置(ossopenapi)|
|**putBucket**|PUT|创建bucket(oss)</br>|
