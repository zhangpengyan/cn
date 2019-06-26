# describeProtectedIpList


## 描述
查询已防护 IP 列表

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/describeProtectedIpList


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码|
|**pageSize**|Integer|False|10|分页大小|
|**instanceId**|Integer|False| |实例 Id, 缺省时查询用户所有已防护 IP|
|**type**|Integer|True| |被防护 IP类型: 0: 全部, 1: 弹性公网 IP, 2: 云物理服务器公网 IP|
|**ip**|String|False| |被防护 IP, 支持模糊查询|


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
|**dataList**|ProtectedIp[]| |
|**currentCount**|Integer|当前页数量|
|**totalCount**|Integer|实例总数|
|**totalPage**|Integer|总页数|
### ProtectedIp
|名称|类型|描述|
|---|---|---|
|**ip**|String|被防护 IP|
|**safeStatus**|Integer|安全状态, 0: 安全, 1: 清洗, 2: 黑洞|
|**resourceType**|Integer|公网 IP 类型或绑定资源类型:<br>  0: 未知类型,<br>  1: 弹性公网 IP(IP 为弹性公网 IP, 绑定资源类型未知),<br>  10: 弹性公网 IP(IP 为弹性公网 IP, 但未绑定资源),<br>  11: 云主机,<br>  12: 负载均衡,<br>  13: 原生容器实例,<br>  14: 原生容器 Pod,<br>  2: 云物理服务器,<br>|
|**protectionRuleType**|Integer|防护规则类型, 0: 默认(防护包的防护规则), 1: IP 自定义规则|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
