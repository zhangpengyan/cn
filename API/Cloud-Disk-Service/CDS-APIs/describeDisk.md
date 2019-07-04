# describeDisk


## 描述
查询某一块云硬盘的信息详情

## 请求方式
GET

## 请求地址
https://disk.jdcloud-api.com/v1/regions/{regionId}/disks/{diskId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**diskId**|String|True| |云硬盘ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询的云硬盘信息详情|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**disk**|Disk| |
### Disk
|名称|类型|描述|
|---|---|---|
|**diskId**|String|云硬盘ID|
|**az**|String|云硬盘所属AZ|
|**name**|String|云硬盘名称，只允许输入中文、数字、大小写字母、英文下划线“_”及中划线“-”，不允许为空且不超过32字符。|
|**description**|String|云硬盘描述，允许输入UTF-8编码下的全部字符，不超过256字符。|
|**diskType**|String|云硬盘类型，取值为 ssd,premium-hdd,ssd.gp1,ssd.io1,hdd.std1|
|**diskSizeGB**|Integer|云硬盘大小，单位为 GiB|
|**iops**|Integer|该云硬盘实际应用的iops值|
|**throughput**|Integer|该云硬盘实际应用的吞吐量的数值|
|**status**|String|云硬盘状态，取值为 creating、available、in-use、extending、restoring、deleting、deleted、error_create、error_delete、error_restore、error_extend 之一|
|**attachments**|DiskAttachment[]|挂载信息|
|**snapshotId**|String|创建该云硬盘的快照ID|
|**multiAttachable**|Boolean|云盘是否支持多挂载|
|**encrypted**|Boolean|云盘是否为加密盘|
|**enable**|Boolean|云盘是否被暂停（IOPS限制为极低）|
|**createTime**|String|创建云硬盘时间|
|**charge**|Charge|云硬盘计费配置信息|
|**tags**|Tag[]|Tag信息|
### Tag
|名称|类型|描述|
|---|---|---|
|**key**|String|Tag键|
|**value**|String|Tag值|
### Charge
|名称|类型|描述|
|---|---|---|
|**chargeMode**|String|支付模式，取值为：prepaid_by_duration，postpaid_by_usage或postpaid_by_duration，prepaid_by_duration表示预付费，postpaid_by_usage表示按用量后付费，postpaid_by_duration表示按配置后付费，默认为postpaid_by_duration|
|**chargeStatus**|String|费用支付状态，取值为：normal、overdue、arrear，normal表示正常，overdue表示已到期，arrear表示欠费|
|**chargeStartTime**|String|计费开始时间，遵循ISO8601标准，使用UTC时间，格式为：YYYY-MM-DDTHH:mm:ssZ|
|**chargeExpiredTime**|String|过期时间，预付费资源的到期时间，遵循ISO8601标准，使用UTC时间，格式为：YYYY-MM-DDTHH:mm:ssZ，后付费资源此字段内容为空|
|**chargeRetireTime**|String|预期释放时间，资源的预期释放时间，预付费/后付费资源均有此值，遵循ISO8601标准，使用UTC时间，格式为：YYYY-MM-DDTHH:mm:ssZ|
### DiskAttachment
|名称|类型|描述|
|---|---|---|
|**attachmentId**|String|挂载ID|
|**diskId**|String|云硬盘ID|
|**instanceType**|String|挂载实例的类型，取值为 vm、nc|
|**instanceId**|String|挂载实例的ID|
|**status**|String|挂载状态，取值为 "attaching", "attached", "detaching", "detached"|
|**attachTime**|String|挂载时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
