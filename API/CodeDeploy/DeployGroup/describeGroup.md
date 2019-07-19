# describeGroup


## 描述
查询一个部署组的信息

## 请求方式
GET

## 请求地址
https://deploy.jdcloud-api.com/v1/regions/{regionId}/group/{groupId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**groupId**|String|True| |Group Id|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**group**|Group| |
### Group
|名称|类型|描述|
|---|---|---|
|**groupId**|String|部署组ID|
|**groupName**|String|部署组名称|
|**appId**|String|应用ID|
|**appName**|String|应用名称|
|**regionId**|String|地域|
|**status**|Integer|状态|
|**platform**|Integer|部署平台：1云主机，2原生容器|
|**desc**|String|描述|
|**deployMethod**|Integer|部署方式：1滚动部署，2蓝绿部署|
|**instances**|String[]|部署实例（滚动）|
|**blueInstances**|String[]|部署实例（蓝）|
|**greenInstances**|String[]|部署实例（绿）|
|**threshold**|Integer|部署阈值|
|**concurrencyUnit**|Integer|并发单位|
|**concurrencyNum**|Integer|并发机器数|
|**concurrencyPct**|Integer|并发度|
|**lbStatus**|Integer|负载均衡：1启动，2禁用|
|**lbInstance**|String|lb实例|
|**lbBackend**|String|lb lb_backend|
|**repeatPolicy**|Integer|同名文件处理方式：1部署失败，2覆盖，3保留|
|**noticeTrigger**|Integer|通知频率：1异常发送，2每次发送|
|**noticeMethod**|Integer[]|通知方式：1消息，2邮件，3短信|
|**rollback**|Integer|自动回滚：1开启，2禁用|
|**jdsfEnabled**|Integer|使用分布式服务框架：0不使用，1使用|
|**jdsfRegisterId**|String|分布式服务框架ID|
|**lastDeployTime**|Integer|上次部署时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
