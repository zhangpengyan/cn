# modifyListener


## 描述
修改监听器

## 请求方式
POST

## 请求地址
https://cps.jdcloud-api.com/v1/regions/{regionId}/listeners/{listenerId}:modifylistenerAttributes

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeRegiones）获取云物理服务器支持的地域|
|**listenerId**|String|True| |监听器ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**algorithm**|String|False| |调度算法|
|**stickySession**|String|False| |会话保持|
|**stickySessionTimeout**|Integer|False| |会话保持超时时间，单位s|
|**cookieType**|String|False| |会话类型ImplantCookie|RewriteCookie|
|**realIp**|String|False| |是否获取真实ip，取值范围on|off|
|**certificateId**|String|False| |证书ID|
|**name**|String|False| |名称|
|**description**|String|False| |描述|
|**headers**|String[]|False| |HTTP扩展头部|
|**healthCheck**|String|False| |健康检查|
|**healthCheckTimeout**|Integer|False| |健康检查响应的最大超时时间|
|**healthCheckInterval**|Integer|False| |健康检查响应的最大间隔时间|
|**healthyThreshold**|Integer|False| |健康检查结果为success的阈值|
|**unhealthyThreshold**|Integer|False| |健康检查结果为fail的阈值|
|**healthCheckUri**|String|False| |健康检查的URI|
|**healthCheckHttpCode**|String|False| |健康检查正常的HTTP状态码|
|**healthCheckIp**|String|False| |健康检查ip|
|**serverGroupId**|String|False| |服务器组id|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**loadBalancer**|Listener|监听器详细信息|
### Listener
|名称|类型|描述|
|---|---|---|
|**listenerId**|String|监听器ID|
|**loadBalancerId**|String|负载均衡ID|
|**protocol**|String|协议|
|**port**|Integer|端口|
|**algorithm**|String|调度算法|
|**stickySession**|String|会话保持状态，取值on|off|
|**stickySessionTimeout**|Integer|会话保持超时时间，单位s|
|**cookieType**|String|会话类型|
|**realIp**|String|获取真实ip|
|**certificateId**|String|证书ID|
|**status**|String|状态|
|**name**|String|名称|
|**description**|String|描述|
|**headers**|String[]|HTTP扩展头部|
|**healthCheck**|String|健康检查状态，取值on|off|
|**healthCheckTimeout**|Integer|健康检查响应的最大超时时间，单位s|
|**healthCheckInterval**|Integer|健康检查响应的最大间隔时间，单位s|
|**healthyThreshold**|Integer|健康检查结果为success的阈值|
|**unhealthyThreshold**|Integer|健康检查结果为fail的阈值|
|**healthCheckUri**|String|健康检查的URI|
|**healthCheckHttpCode**|String|健康检查正常的HTTP状态码|
|**healthCheckIp**|String|健康检查ip|
|**serverGroupId**|String|服务器组id|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Bad request|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
