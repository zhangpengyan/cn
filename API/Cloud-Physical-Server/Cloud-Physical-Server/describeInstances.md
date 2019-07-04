# describeInstances


## 描述
批量查询云物理服务器详细信息<br/>
支持分页查询，默认每页20条<br/>


## 请求方式
GET

## 请求地址
https://cps.jdcloud-api.com/v1/regions/{regionId}/instances

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeRegiones）获取云物理服务器支持的地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码；默认为1|
|**pageSize**|Integer|False|20|分页大小；默认为20；取值范围[20, 100]|
|**az**|String|False| |可用区，精确匹配|
|**name**|String|False| |云物理服务器名称，支持模糊匹配|
|**networkType**|String|False| |网络类型，精确匹配，支持basic，vpc|
|**deviceType**|String|False| |实例类型，精确匹配，调用接口（describeDeviceTypes）获取实例类型|
|**subnetId**|String|False| |子网ID|
|**enableInternet**|String|False| |是否启用外网, yes/no|
|**filters**|Filter[]|False| |instanceId - 云物理服务器ID，精确匹配，支持多个<br/><br>privateIp - 云物理服务器内网IP，精确匹配，支持多个<br/><br>status - 云物理服务器状态，参考云物理服务器状态，精确匹配，支持多个<br>|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**instances**|Instance[]| |
|**pageNumber**|Integer|页码；默认为1|
|**pageSize**|Integer|分页大小；默认为20；取值范围[20, 100]|
|**totalCount**|Integer|查询结果总数|
### Instance
|名称|类型|描述|
|---|---|---|
|**instanceId**|String|云物理服务器实例ID|
|**region**|String|区域代码, 如 cn-east-1|
|**az**|String|可用区, 如 cn-east-1a|
|**deviceType**|String|实例类型, 如 cps.c.normal|
|**name**|String|云物理服务器名称|
|**description**|String|云物理服务器描述|
|**status**|String|云物理服务器生命周期状态|
|**enableInternet**|String|是否启用外网, 如 yes/no|
|**enableIpv6**|String|是否启用IPv6, 如 yes/no|
|**bandwidth**|Integer|带宽, 单位Mbps|
|**imageType**|String|镜像类型, 如 standard|
|**osTypeId**|String|操作系统类型ID|
|**osName**|String|操作系统名称|
|**osType**|String|操作系统类型, 如 ubuntu/centos|
|**osVersion**|String|操作系统版本, 如 16.04|
|**sysRaidTypeId**|String|系统盘RAID类型ID|
|**sysRaidType**|String|系统盘RAID类型, 如 NORAID, RAID0, RAID1|
|**dataRaidTypeId**|String|数据盘RAID类型ID|
|**dataRaidType**|String|数据盘RAID类型, 如 NORAID, RAID0, RAID1|
|**networkType**|String|网络类型, 如 basic, vpc|
|**vpcId**|String|私有网络ID|
|**vpcName**|String|私有网络名称|
|**subnetId**|String|子网编号|
|**subnetName**|String|子网名称|
|**privateIp**|String|内网IP|
|**lineType**|String|外网链路类型, 如 bgp|
|**elasticIpId**|String|弹性公网IPID|
|**publicIp**|String|公网IP|
|**publicIpv6**|String|公网IPv6|
|**charge**|Charge|计费信息|
### Charge
|名称|类型|描述|
|---|---|---|
|**chargeMode**|String|支付模式，取值为：prepaid_by_duration，postpaid_by_usage或postpaid_by_duration，prepaid_by_duration表示预付费，postpaid_by_usage表示按用量后付费，postpaid_by_duration表示按配置后付费，默认为postpaid_by_duration|
|**chargeStatus**|String|费用支付状态，取值为：normal、overdue、arrear，normal表示正常，overdue表示已到期，arrear表示欠费|
|**chargeStartTime**|String|计费开始时间，遵循ISO8601标准，使用UTC时间，格式为：YYYY-MM-DDTHH:mm:ssZ|
|**chargeExpiredTime**|String|过期时间，预付费资源的到期时间，遵循ISO8601标准，使用UTC时间，格式为：YYYY-MM-DDTHH:mm:ssZ，后付费资源此字段内容为空|
|**chargeRetireTime**|String|预期释放时间，资源的预期释放时间，预付费/后付费资源均有此值，遵循ISO8601标准，使用UTC时间，格式为：YYYY-MM-DDTHH:mm:ssZ|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Bad request|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
