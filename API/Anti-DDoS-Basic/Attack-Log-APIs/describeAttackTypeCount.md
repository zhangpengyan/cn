# describeAttackTypeCount


## 描述
查询各类型攻击次数

## 请求方式
GET

## 请求地址
https://baseanti.jdcloud-api.com/v1/describeAttackTypeCount


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**startTime**|String|True| |开始时间, UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**endTime**|String|True| |结束时间, UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**ip**|String[]|False| |基础防护已防护的公网 IP, ip 不为空时, 查询 ip 对应的各类型攻击次数, ip 为空时, 查询用户所有公网 IP 的各类型攻击次数<br>- 使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describeelasticipresources">describeElasticIpResources</a> 接口查询基础防护已防护的私有网络弹性公网 IP<br>- 使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describecpsipresources">describeCpsIpResources</a> 接口查询基础防护已防护的云物理服务器公网IP 和 弹性公网 IP<br>|


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
|**dataList**|AttackTypeCount[]| |
### AttackTypeCount
|名称|类型|描述|
|---|---|---|
|**type**|String|攻击类型|
|**count**|Integer|攻击次数|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
