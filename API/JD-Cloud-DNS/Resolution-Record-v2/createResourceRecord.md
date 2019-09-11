# createResourceRecord


## 描述
添加主域名的解析记录

## 请求方式
POST

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/ResourceRecord

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**req**|AddRR|True| |RR参数|

### AddRR
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**hostRecord**|String|True| |主机记录|
|**hostValue**|String|True| |解析记录的值|
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
|**dataList**|RR|添加成功后的解析记录结果|
### RR
|名称|类型|描述|
|---|---|---|
|**id**|Integer|域名解析的唯一ID|
|**hostRecord**|String|主机记录|
|**hostValue**|String|解析记录的值|
|**jcloudRes**|Boolean|是否是京东云资源|
|**mxPriority**|Integer|优先级，只存在于MX, SRV解析记录类型|
|**port**|Integer|端口，只存在于SRV解析记录类型|
|**ttl**|Integer|解析记录的生存时间，单位：秒|
|**type**|String|解析记录的类型，有A, AAAA, CNAME, JNAME, TXT, MX, CAA, NS, SRV, IMPLICIT_URL，EXPLICIT_URL几种记录类型|
|**weight**|Integer|解析记录的权重|
|**viewValue**|Integer[]|解析线路的ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
