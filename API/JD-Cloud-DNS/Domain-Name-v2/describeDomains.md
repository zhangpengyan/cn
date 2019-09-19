# describeDomains


## 描述
获取用户所属的主域名列表。   
请在调用域名相关的接口之前，调用此接口获取相关的domainId和domainName。  
主域名的相关概念，请查阅<a href="https://docs.jdcloud.com/cn/jd-cloud-dns/product-overview">云解析文档</a>


## 请求方式
GET

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|True| |分页查询时查询的每页的序号，起始值为1，默认为1|
|**pageSize**|Integer|True| |分页查询时设置的每页行数，默认为10|
|**domainName**|String|False| |关键字，按照”%domainName%”模式匹配主域名|
|**domainId**|Integer|False| |域名ID。不为0时，只查此domainId的域名|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|此次请求的ID|

### Result
|名称|类型|描述|
|---|---|---|
|**dataList**|DomainInfo[]|域名列表|
|**currentCount**|Integer|当前页的域名列表里域名的个数|
|**totalCount**|Integer|所有匹配的域名列表的个数|
|**totalPage**|Integer|所有匹配的域名列表按照分页参数一共的页数|
### DomainInfo
|名称|类型|描述|
|---|---|---|
|**id**|Integer|域名的唯一ID|
|**domainName**|String|域名字符串|
|**createTime**|Long|创建时间，格式Unix timestamp，时间单位：毫秒|
|**expirationDate**|Long|过期时间，格式Unix timestamp，时间单位：毫秒|
|**packId**|Integer|套餐类型，免费:0 企业版:1 企业高级版:2|
|**packName**|String|套餐的名字|
|**resolvingStatus**|String|解析的状态, 暂无解析:1，正常解析:2， 部分解析:3， 暂停解析:4 NS未修改:5|
|**creator**|String|创建者|
|**jcloudNs**|Boolean|是否是京东云资源|
|**lockStatus**|Integer|域名的锁定状态，0:未锁定， 1:已锁定|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
