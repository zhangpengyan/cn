# modifyMonitorStatus


## 描述
监控项的操作集合，包括：暂停，启动, 手动恢复, 手动切换

## 请求方式
PUT

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/monitor/{monitorId}/status

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|
|**monitorId**|String|True| |监控项ID，请使用describeMonitor接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**action**|String|True| |暂停stop, 开启start, 手动恢复recover，手动切换switch，手动恢复和手动切换时候不支持批量操作|
|**switchTarget**|String|False| |监控项的主机值, 手动切换时必填|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|此次请求的ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
