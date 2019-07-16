# describeCpsIpResources


## 描述
查询云物理服务器公网 IP 的安全信息. 包括云物理服务器的公网 IP 和弹性公网 IP.


## 请求方式
GET

## 请求地址
https://baseanti.jdcloud-api.com/v1/regions/{regionId}/cpsIpResources

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域编码. 基础防护已支持华北-北京, 华东-宿迁, 华东-上海, 华南-广州|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码|
|**pageSize**|Integer|False|10|分页大小|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |
|**error**|Error| |

### Error
|名称|类型|描述|
|---|---|---|
|**err**|Err| |
### Err
|名称|类型|描述|
|---|---|---|
|**code**|Long|同http code|
|**details**|Object| |
|**message**|String| |
|**status**|String|具体错误|
### Result
|名称|类型|描述|
|---|---|---|
|**dataList**|IpResource[]| |
|**currentCount**|Integer|当前页数量|
|**totalCount**|Integer|总数|
|**totalPage**|Integer|总页数|
### IpResource
|名称|类型|描述|
|---|---|---|
|**region**|String|公网 IP 所在区域编码|
|**resourceType**|Integer|公网 IP 类型或绑定资源类型:<br>  0: 未知类型,<br>  1: 弹性公网 IP(IP 为弹性公网 IP, 绑定资源类型未知),<br>  10: 弹性公网 IP(IP 为弹性公网 IP, 但未绑定资源),<br>  11: 云主机,<br>  12: 负载均衡,<br>  13: 原生容器实例,<br>  14: 原生容器 Pod,<br>  2: 云物理服务器,<br>|
|**ip**|String|公网 IP 地址|
|**bandwidth**|Long|带宽上限, 单位 Mbps|
|**cleanThresholdBps**|Long|每秒请求流量|
|**cleanThresholdPps**|Long|每秒报文请求数|
|**blackHoleThreshold**|Long|黑洞阈值|
|**instanceId**|Long|绑定防护包 ID, 为 0 时表示未绑定防护包|
|**instanceName**|String|绑定防护包名称, 为空字符串时表示未绑定防护包|
|**instanceType**|Integer|套餐类型, 1: 独享 IP, 2: 共享 IP, 为 0 时未绑定防护包|
|**safeStatus**|Integer|安全状态, 0: 安全, 1: 清洗, 2: 黑洞|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
