# createInstance


## 描述
新购或升级高防实例

## 请求方式
POST

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**createInstanceSpec**|CreateInstanceSpec|True| |新购或升级实例请求参数|

### CreateInstanceSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|Long|False| |实例 Id, 升级时必传|
|**name**|String|False| |实例名称, 新购时必传|
|**buyType**|Integer|True| |购买类型：1新购 3升级|
|**carrier**|Integer|True| |链路类型, 1: 电信, 2: 电信、联通, 3: 电信、联通和移动|
|**ipType**|Integer|True| |可防护 ip 类型, 目前仅电信线路支持 IPV6 线路:<br>- 0: IPV4,<br>- 1: IPV4/IPV6<br>|
|**bp**|Integer|True| |保底带宽：单位Gbps|
|**ep**|Integer|True| |弹性带宽：单位Gbps|
|**bw**|Integer|True| |业务带宽：单位Mbps|
|**timeSpan**|Long|False| |购买防护包时长, 新购高防实例时必传<br>- timeUnit 为 3 时, 可取值 1-9<br>- timeUnit 为 4 时, 可取值 1-3<br>|
|**timeUnit**|Integer|False| |购买时长类型, 新购高防实例时必传<br>- 3: 月<br>- 4: 年<br>|
|**returnUrl**|String|False| |支付成功后跳转的页面，控制台交互模式传该字段|

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
|**code**|Integer|0: 新购或升级实例失败, 1: 新购或升级实例成功|
|**message**|String|新购或升级成功时为 订单 id, 创建实例失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
