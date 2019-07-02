# describeIpMonitorFlow


## 描述
查询公网 IP 的监控流量

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/describeIpMonitorFlow


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**startTime**|String|True| |开始时间, 只能查询最近 90 天以内的数据, UTC 时间, 格式：yyyy-MM-dd'T'HH:mm:ssZ|
|**endTime**|String|True| |查询的结束时间, UTC 时间, 格式：yyyy-MM-dd'T'HH:mm:ssZ|
|**ip**|String[]|True| |DDoS 防护包已防护的公网 IP<br>- 使用 <a href="http://docs.jdcloud.com/anti-ddos-protection-package/api/describeprotectediplist">describeProtectedIpList</a> 接口查询 DDoS 防护包已防护的公网 IP<br>|


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
|**bps**|IpResourceFlow| |
|**pps**|IpResourceFlow| |
### IpResourceFlow
|名称|类型|描述|
|---|---|---|
|**time**|String[]|时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**postProtect**|Double[]|防护后流量|
|**preProtect**|Double[]|防护前流量|
|**unit**|String|流量单位|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
