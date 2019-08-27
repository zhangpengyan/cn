# getLbHttpListener


## 描述
根据过滤条件，查监听器列表

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_lbHttpListener

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|
|**slbid**|String|False| |负载均衡id|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**httpListeners**|LbHttpListener[]| |
### LbHttpListener
|名称|类型|描述|
|---|---|---|
|**listenerPort**|Integer|负载均衡实例前端使用的端口。|
|**backendServerPort**|Integer|负载均衡实例后端使用的端口。|
|**status**|String|当前监听的状态。|
|**scheduler**|String|调度算法。|
|**vServerGroupId**|String|绑定的服务器组ID。|
|**healthCheck**|String|是否开启健康检查。|
|**healthCheckConnectPort**|Integer|否  健康检查使用的端口|
|**healthyThreshold**|Integer|否  健康检查连续成功多少次后，将后端服务器的健康检查状态由fail判定为success。取值：2-10|
|**unhealthyThreshold**|Integer|否  健康检查连续失败多少次后，将后端服务器的健康检查状态由success判定为fail。取值：2-10|
|**healthCheckTimeout**|Integer|否  接收来自运行状况检查的响应需要等待的时间。如果后端ECS在指定的时间内没有正确响应，则判定为健康检查失败。取值：1-300（秒）|
|**healthCheckInterval**|Integer|否  健康检查的时间间隔。取值：1-50（秒）|
|**healthCheckHttpCode**|String|否  健康检查正常的HTTP状态码，多个状态码用逗号分隔。取值：http_2xx（默认值） | http_3xx | http_4xx | http_5xx|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
