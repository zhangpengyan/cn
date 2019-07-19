# createCacheInstance


## 描述
创建一个指定配置的缓存Redis实例：可选择主从版或集群版，每种类型又分为多种规格（按CPU核数、内存容量、磁盘容量、带宽等划分），具体可参考产品规格代码，https://docs.jdcloud.com/cn/jcs-for-redis/specifications


## 请求方式
POST

## 请求地址
https://redis.jdcloud-api.com/v1/regions/{regionId}/cacheInstance

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |缓存Redis实例所在区域的Region ID。目前有华北-北京、华南-广州、华东-上海三个区域，Region ID分别为cn-north-1、cn-south-1、cn-east-2|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**cacheInstance**|CacheInstanceSpec|True| |创建实例时输入的信息|
|**charge**|ChargeSpec|False| |该实例规格的计费信息|

### ChargeSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**chargeMode**|String|False|postpaid_by_duration|计费模式，取值为：prepaid_by_duration，postpaid_by_usage或postpaid_by_duration，prepaid_by_duration表示预付费，postpaid_by_usage表示按用量后付费，postpaid_by_duration表示按配置后付费，默认为postpaid_by_duration.请参阅具体产品线帮助文档确认该产品线支持的计费类型|
|**chargeUnit**|String|False| |预付费计费单位，预付费必填，当chargeMode为prepaid_by_duration时有效，取值为：month、year，默认为month|
|**chargeDuration**|Integer|False| |预付费计费时长，预付费必填，当chargeMode取值为prepaid_by_duration时有效。当chargeUnit为month时取值为：1~9，当chargeUnit为year时取值为：1、2、3|
### CacheInstanceSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**vpcId**|String|True| |缓存Redis实例所属的私有网络ID|
|**subnetId**|String|True| |缓存Redis实例在私有网络下所属的子网ID|
|**cacheInstanceName**|String|True| |缓存Redis实例名称，只支持数字、字母、英文下划线、中文，且不少于2字符不超过32字符|
|**cacheInstanceClass**|String|True| |缓存Redis实例的规格代码，参考 https://docs.jdcloud.com/cn/jcs-for-redis/specifications|
|**password**|String|False| |缓存Redis实例的连接密码，为空即为免密，包含且只支持字母及数字，不少于8字符不超过16字符|
|**azId**|AzIdSpec|True| |缓存Redis实例所在区域的可用区ID|
|**cacheInstanceDescription**|String|False| |缓存Redis实例的描述，不能超过256个字符|
|**redisVersion**|String|False| |支持的缓存Redis引擎主次版本号：目前支持2.8和4.0，默认为2.8|
|**ipv6On**|Integer|False| |是否支持IPv6，0或空表示不支持，1表示支持IPv6，注意不是所有区域都支持IPv6|
### AzIdSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**master**|String|False| |缓存Redis主实例所在区域可用区ID|
|**slave**|String|False| |缓存Redis从实例所在区域可用区ID|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|结果|
|**requestId**|String|本次请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**cacheInstanceId**|String|创建实例后生成的实例ID|
|**orderNum**|String|创建实例后生成的订单编号|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
