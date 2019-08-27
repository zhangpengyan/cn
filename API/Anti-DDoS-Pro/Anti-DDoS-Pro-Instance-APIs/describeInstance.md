# describeInstance


## 描述
查询实例

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|
|**instanceId**|String|True| |实例 ID|

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
|**data**|Instance| |
### Instance
|名称|类型|描述|
|---|---|---|
|**id**|String|实例 ID|
|**name**|String|实例名称|
|**carrier**|Integer|链路类型. <br>- 1: 电信<br>- 3: 电信、联通和移动|
|**ipType**|Integer|可防护 IP 类型, 目前仅电信线路支持 IPV6 线路. <br>- 0: IPV4. <br>- 1: IPV4/IPV6|
|**elasticTriggerCount**|Integer|触发弹性带宽的次数|
|**abovePeakCount**|Integer|超峰次数|
|**inBitslimit**|Integer|保底带宽|
|**resilientBitslimit**|Integer|弹性带宽|
|**businessBitslimit**|Integer|业务带宽大小|
|**ccThreshold**|Integer|CC 阈值大小|
|**ccPeakQPS**|Integer|CC 防护峰值, 单位: QPS|
|**ruleCount**|Integer|非网站类规则数|
|**webRuleCount**|Integer|网站类规则数|
|**chargeStatus**|String|计费状态. <br>- PAID: 已支付<br>- ARREARS: 欠费<br>- EXPIRED: 过期|
|**securityStatus**|String|安全状态. <br>- SAFE: 安全<br>- CLEANING: 清洗中<br>- BLOCKING: 封禁中|
|**createTime**|String|实例的创建的时间|
|**expireTime**|String|实例的过期时间|
|**resourceId**|String|资源 ID, 升级和续费时使用|
|**ccObserveMode**|Integer|CC 防护观察者模式. <br>- 0: 关闭 <br>- 1: 开启|
|**ccProtectMode**|Integer|CC 防护模式. <br>- 0: 正常 <br>- 1: 紧急 <br>- 2: 宽松 <br>- 3: 自定义|
|**ccProtectStatus**|Integer|CC 开关状态. <br>- 0: 关闭 <br>- 1: 开启|
|**ccSpeedLimit**|Integer|CC 防护模式为自定义时的限速大小|
|**ccSpeedPeriod**|Integer|CC 防护模式为自定义时的限速周期|
|**ipBlackList**|String[]|IP 黑名单列表|
|**ipBlackStatus**|Integer|IP 黑名单状态. <br>- 0: 关闭 <br>- 1: 开启|
|**ipWhiteList**|String[]|IP 白名单列表|
|**ipWhiteStatus**|Integer|IP 白名单状态. <br>- 0: 关闭<br>- 1: 开启|
|**urlWhitelist**|String[]|url白名单列表|
|**urlWhitelistStatus**|Integer|url白名单状态. <br>- 0: 关闭<br>- 1: 开启|
|**hostQps**|Integer|ccProtectMode为自定义模式时, 每个Host的防护阈值|
|**hostUrlQps**|Integer|ccProtectMode为自定义模式时, 每个Host+URI的防护阈值|
|**ipHostQps**|Integer|ccProtectMode为自定义模式时, 每个源IP对Host的防护阈值|
|**ipHostUrlQps**|Integer|ccProtectMode为自定义模式时, 每个源IP对Host+URI的防护阈值|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
