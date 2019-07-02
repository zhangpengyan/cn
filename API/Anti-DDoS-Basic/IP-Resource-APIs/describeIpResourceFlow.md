# describeIpResourceFlow


## 描述
查询公网 IP 的 endTime 之前 15 分钟内监控流量, 仅支持 ipv4. (已废弃, 建议使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describeipmonitorflow">describeIpMonitorFlow</a> 接口)


## 请求方式
GET

## 请求地址
https://baseanti.jdcloud-api.com/v1/regions/{regionId}/ipResources/{ip}/monitorFlow

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域编码. 基础防护已支持华北-北京, 华东-宿迁, 华东-上海, 华南-广州|
|**ip**|String|True| |基础防护已防护的公网 IP, 仅支持 ipv4 格式<br>- 使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describeelasticipresources">describeElasticIpResources</a> 接口查询基础防护已防护的私有网络弹性公网 IP<br>- 使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describecpsipresources">describeCpsIpResources</a> 接口查询基础防护已防护的云物理服务器公网IP 和 弹性公网 IP|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**endTime**|String|False| |查询的结束时间, UTC时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ, 为空时查询当前时间之前 15 分钟内监控流量|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**bps**|IpResourceFlow| |
|**pps**|IpResourceFlow| |
### IpResourceFlow
|名称|类型|描述|
|---|---|---|
|**time**|String[]|UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**postProtect**|Double[]|防护后流量|
|**preProtect**|Double[]|防护前流量|
|**unit**|String|流量单位|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
