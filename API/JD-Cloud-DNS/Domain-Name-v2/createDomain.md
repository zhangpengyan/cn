# createDomain


## 描述
添加主域名  
如何添加免费域名，详细情况请查阅<a href="https://docs.jdcloud.com/cn/jd-cloud-dns/domainadd">文档</a>
添加收费域名，请查阅<a href="https://docs.jdcloud.com/cn/jd-cloud-dns/purchase-process">文档</a>，
添加收费域名前，请确保用户的京东云账户有足够的资金支付，Openapi接口回返回订单号，可以用此订单号向计费系统查阅详情。


## 请求方式
POST

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**packId**|Integer|True| |主域名的套餐类型, 免费:0 企业版:1 企业高级版:2|
|**domainName**|String|True| |要添加的主域名|
|**domainId**|Integer|False| |主域名的ID，升级套餐必填，请使用describeDomains获取|
|**buyType**|Integer|False| |新购买:1、升级:3，收费套餐的域名必填|
|**timeSpan**|Integer|False| |取值1，2，3 ，含义：时长，收费套餐的域名必填|
|**timeUnit**|Integer|False| |时间单位，收费套餐的域名必填，1：小时，2：天，3：月，4：年|
|**billingType**|Integer|False| |计费类型，可以不传此参数。|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|此次请求的ID|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|DomainAdded|新添加的的域名结构|
|**order**|String|添加收费版域名的订单号|
### DomainAdded
|名称|类型|描述|
|---|---|---|
|**id**|Integer|域名的唯一ID|
|**domainName**|String|域名字符串|
|**createTime**|Long|创建时间，格式Unix timestamp，时间单位：毫秒|
|**expirationDate**|Long|过期时间，格式Unix timestamp，时间单位：毫秒|
|**packId**|Integer|套餐类型，免费:0 企业版:1 企业高级版:2|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
