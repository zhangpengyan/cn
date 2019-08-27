# batchSetResourceRecords


## 描述
同一个主域名下，批量新增或者批量更新导入解析记录。
如果解析记录的ID为0，是新增解析记录，如果不为0，则是更新解析记录。


## 请求方式
POST

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/BatchSetResourceRecords

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**req**|BatchSetDNS[]|True| |需要设置的解析记录列表|

### BatchSetDNS
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**hostRecord**|String|True| |主机记录|
|**hostValue**|String|True| |解析记录的值|
|**id**|Integer|True| |解析记录的ID, 如果是新增请填0，如果是更新，请使用describeResourceRecord接口查询解析记录ID。|
|**jcloudRes**|Boolean|False| |是否是京东云资源|
|**mxPriority**|Integer|False| |优先级，只存在于MX, SRV解析记录类型|
|**port**|Integer|False| |端口，只存在于SRV解析记录类型|
|**ttl**|Integer|True| |解析记录的生存时间，单位：秒|
|**type**|String|True| |解析的类型，请参考<a href="https://docs.jdcloud.com/cn/jd-cloud-dns/detailed-interpretation-of-parsed-records">解析记录类型详解</a>|
|**weight**|Integer|False| |解析记录的权重，目前支持权重的有：A/AAAA/CNAME/JNAME，A/AAAA权重范围：0-100、CNAME/JNAME权重范围：1-100。|
|**viewValue**|Integer|True| |解析线路的ID，请调用describeViewTree接口获取基础解析线路的ID，使用describeUserView接口获取自定义线路的ID。|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|此次请求的ID|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|String[]|对应每条设置的解析列表的结果|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
