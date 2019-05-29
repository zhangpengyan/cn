# describeAttackStatistics


## 描述
攻击记录统计, 参数 ip 优先级大于 instanceId
  - 指定 ip 参数时, 忽略 instanceId 参数, 统计 ip 的攻击情况
  - 未指定 ip 时, 统计 instanceId 指定实例相关攻击情况
  - ip 和 instanceId 均未指定时, 查询用户所有公网 IP 攻击情况


## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/describeAttackStatistics


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**startTime**|String|True| |开始时间, 只能查询最近 90 天以内的数据, UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**endTime**|String|True| |结束时间, UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**instanceId**|String|False| |防护包实例 Id|
|**ip**|String[]|False| |DDoS 防护包已防护的公网 IP<br>- 使用 <a href="http://docs.jdcloud.com/anti-ddos-protection-package/api/describeprotectediplist">describeProtectedIpList</a> 接口查询 DDoS 防护包已防护的公网 IP<br>|


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
|**attackCount**|Integer|攻击次数|
|**blackHoleCount**|Integer|黑洞次数|
|**peak**|Double|攻击流量峰值|
|**unit**|String|攻击流量单位|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
