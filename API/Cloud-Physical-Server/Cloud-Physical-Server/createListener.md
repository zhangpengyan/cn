# createListener


## 描述
创建监听器

## 请求方式
PUT

## 请求地址
https://cps.jdcloud-api.com/v1/regions/{regionId}/listeners

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeRegiones）获取云物理服务器支持的地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**clientToken**|String|False| |由客户端生成，用于保证请求的幂等性，长度不能超过36个字符；<br/><br>如果多个请求使用了相同的clientToken，只会执行第一个请求，之后的请求直接返回第一个请求的结果<br/><br>|
|**loadBalancerSpec**|ListenerSpec|True| |监听器配置|

### ListenerSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**loadBalancerId**|String|True| |负载均衡实例ID|
|**protocol**|String|True| |协议, 如TCP|
|**port**|Integer|True| |端口1-65535|
|**algorithm**|String|True| |调度算法，取值wrr（加权轮询）|wlc（加权最小连接数）|conhash（源IP）)|
|**stickySession**|String|True| |是否开启会话保持，取值on|off|
|**stickySessionTimeout**|Integer|False| |会话保持超时时间，单位s|
|**cookieType**|String|False| |会话类型，取值ImplantCookie|RewriteCookie|
|**realIp**|String|False| |是否获取真实ip，取值on|off|
|**certificateId**|String|False| |证书ID|
|**name**|String|True| |名称|
|**description**|String|False| |描述|
|**headers**|String[]|False| |HTTP扩展头部|
|**healthCheck**|String|True| |是否开启健康检查，取值on|off|
|**healthCheckTimeout**|Integer|False| |健康检查响应的最大超时时间，单位s|
|**healthCheckInterval**|Integer|False| |健康检查响应的最大间隔时间，单位s|
|**healthyThreshold**|Integer|False| |健康检查结果为success的阈值|
|**unhealthyThreshold**|Integer|False| |健康检查结果为fail的阈值|
|**healthCheckUri**|String|False| |健康检查的URI|
|**healthCheckHttpCode**|String|False| |健康检查正常的HTTP状态码，多个用,隔开|
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
|**listenerId**|String|监听器ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Bad request|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
