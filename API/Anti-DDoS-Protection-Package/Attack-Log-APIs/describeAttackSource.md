# describeAttackSource


## 描述
查询攻击来源

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/attacklog/{attackLogId}:describeAttackSource

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**attackLogId**|String|True| |攻击记录 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ip**|String|True| |DDoS 防护包已防护的公网 IP<br>- 使用 <a href="http://docs.jdcloud.com/anti-ddos-protection-package/api/describeprotectediplist">describeProtectedIpList</a> 接口查询 DDoS 防护包已防护的公网 IP<br>|


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
|**data**|String[]|攻击来源 IP 列表|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
