# describeInstance


## 描述
查询实例

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**instanceId**|Long|True| |实例 ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |
|**error**|Error| |

### Error
|名称|类型|描述|
|---|---|---|
|**code**|Integer|请求错误状态码|
|**status**|String|请求错误状态码|
|**message**|String|请求错误提示|
### Result
|名称|类型|描述|
|---|---|---|
|**data**|Instance| |
### Instance
|名称|类型|描述|
|---|---|---|
|**id**|Long|实例 Id|
|**name**|String|实例名称|
|**carrier**|Integer|链路类型, 1: 电信, 2: 电信、联通, 3: 电信、联通和移动|
|**ipType**|Integer|可防护 ip 类型, 目前仅电信线路支持 IPV6 线路:<br>- 0: IPV4,<br>- 1: IPV4/IPV6<br>|
|**elasticTriggerCount**|Integer|触发弹性带宽的次数|
|**abovePeakCount**|Integer|超峰次数|
|**inBitslimit**|Integer|保底带宽|
|**resilientBitslimit**|Integer|弹性带宽|
|**businessBitslimit**|Integer|业务带宽大小|
|**ccThreshold**|Integer|cc阈值大小|
|**ruleCount**|Integer|非网站类规则数|
|**webRuleCount**|Integer|网站类规则数|
|**chargeStatus**|String|PAID|ARREARS|EXPIRED|
|**securityStatus**|String|SAFE|CLEANING|BLOCKING|
|**createTime**|String|实例的创建的时间|
|**expireTime**|String|实例的过期时间|
|**resourceId**|String|资源id，升级和续费时使用|
|**ccProtectMode**|Integer|cc防护模式，0正常、1紧急、2宽松、3自定义|
|**ccProtectStatus**|Integer|cc开关状态，0关闭，1开启|
|**ccSpeedLimit**|Integer|cc防护模式为自定义时的限速大小|
|**ccSpeedPeriod**|Integer|cc防护模式为自定义时的限速周期|
|**ipBlackList**|String[]|ip黑名单列表|
|**ipBlackStatus**|Integer|ip黑名单状态，0关闭，1开启|
|**ipWhiteList**|String[]|ip白名单列表|
|**ipWhiteStatus**|Integer|ip白名单状态，0关闭，1开启|
|**urlWhitelist**|String[]|url白名单列表|
|**urlWhitelistStatus**|Integer|url白名单状态，0关闭，1开启|
|**hostQps**|Integer|ccProtectMode为自定义模式时，每个Host的防护阈值|
|**hostUrlQps**|Integer|ccProtectMode为自定义模式时，每个Host+URI的防护阈值|
|**ipHostQps**|Integer|ccProtectMode为自定义模式时，每个源IP对Host的防护阈值|
|**ipHostUrlQps**|Integer|ccProtectMode为自定义模式时，每个源IP对Host+URI的防护阈值|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
