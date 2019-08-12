# describeResourceRecord


## 描述
查询主域名的解析记录。  
在使用解析记录相关的接口之前，请调用此接口获取解析记录的列表。


## 请求方式
GET

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/ResourceRecord

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False| |当前页数，起始值为1，默认为1|
|**pageSize**|Integer|False| |分页查询时设置的每页行数, 默认为10|
|**search**|String|False| |关键字，按照”%search%”模式匹配解析记录的主机记录|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|此次请求的ID|

### Result
|名称|类型|描述|
|---|---|---|
|**dataList**|RRInfo[]|解析记录列表|
|**totalCount**|Integer|所有解析记录的个数|
|**totalPage**|Integer|所有解析记录的页数|
|**currentCount**|Integer|当前页解析记录的个数|
### RRInfo
|名称|类型|描述|
|---|---|---|
|**creator**|String|创建者|
|**viewName**|String|线路名称|
|**id**|Integer|域名解析的唯一ID|
|**hostRecord**|String|主机记录|
|**hostValue**|String|解析记录的值|
|**jcloudRes**|Boolean|是否是京东云资源|
|**mxPriority**|Integer|优先级，只存在于MX, SRV解析记录类型|
|**port**|Integer|端口，只存在于SRV解析记录类型|
|**ttl**|Integer|解析记录的生存时间，单位：秒|
|**type**|String|解析记录的类型，请参考<a href="https://docs.jdcloud.com/cn/jd-cloud-dns/detailed-interpretation-of-parsed-records">解析记录类型详解</a>|
|**weight**|Integer|解析记录的权重|
|**viewValue**|Integer[]|解析线路的ID|
|**resolvingStatus**|String|解析记录的状态，正常解析:2，暂停解析:4|
|**updateTime**|Long|解析记录更新的时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
