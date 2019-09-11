# getStoreService


## 描述
获取云存服务信息

## 请求方式
GET

## 请求地址
https://elite.cn-south-1.jdcloud-api.com/v1/regions/{regionId}/getStoreService

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**buyerPin**|String|True| |购买用户pin|
|**businessData**|String|True| |业务数据，与下单时的业务数据一致|
|**queryAll**|Boolean|False| |是否查询全部，如果传入false，则只查询当前时间有效的，否则查询所有的|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID，每次请求都不一样|

### Result
|名称|类型|描述|
|---|---|---|
|**status**|Boolean|true为成功，false为失败|
|**message**|String|描述信息|
|**data**|StoreServiceVo|查询数据结果|
### StoreServiceVo
|名称|类型|描述|
|---|---|---|
|**buyerPin**|String|购买用户pin|
|**businessData**|String|业务数据，下单时传入的|
|**storeServiceDetails**|StoreServiceDetailVo[]|云存服务明细列表|
|**orderNum**|Integer|订单数量|
|**updateTime**|String|更新时间，格式：yyyy-MM-dd HH:mm:ss|
### StoreServiceDetailVo
|名称|类型|描述|
|---|---|---|
|**spuId**|Integer|商品spu对应的id|
|**skuId**|Integer|商品sku对应的id|
|**storeDays**|Integer|滚存天数|
|**startTime**|String|开始时间，格式：yyyy-MM-dd HH:mm:ss|
|**endTime**|String|结束时间，格式：yyyy-MM-dd HH:mm:ss|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**500**|Internal server error|
