# startSlbListener


## 描述
启动监听器

## 请求方式
PUT

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_slbs_listener/{id}:start

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |负载均衡id|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-cloudid**|String|True| |云注册信息ID|
|**listenerPort**|Integer|True| |监听器端口|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**204**|No content|
|**404**|Listener not found|
