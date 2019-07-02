# updateMonitor


## 描述
域名的监控项修改

## 请求方式
POST

## 请求地址
https://clouddnsservice.jdcloud-api.com/v1/regions/{regionId}/domain/{domainId}/monitorUpdate

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|String|True| |域名ID，请使用getDomains接口获取。|
|**regionId**|String|True| |实例所属的地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**updateMonitor**|UpdateMonitor|True| |监控项设置信息|

### UpdateMonitor
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**alarmLimit**|Integer|True| |连续几次触发报警|
|**id**|Integer|True| |监控项ID|
|**ipBackup01**|String|True| |备用地址1|
|**ipBackup02**|String|True| |备用地址2|
|**monitorEnable**|Integer|True| |监控状况 开启监控 2，暂停监控 4|
|**monitorFreq**|Integer|True| |监控频率，单位秒|
|**monitorPort**|Integer|True| |监控端口|
|**monitorRule**|Integer|True| |不做任何修改0，强制暂停解析记录1，自动切换到备用地址2|
|**monitorUri**|String|True| |监控路径|
|**notifyEmailEnable**|Integer|True| |不发送邮件0， 发送邮件1|
|**notifyMsgBarEnable**|Integer|True| |不发送通知栏 0， 发送通知栏 1|
|**notifySmsEnable**|Integer|False| |不发送短信 0， 发送短信 1|
|**protocol**|Integer|True| |https 0，https 1|
|**stopRecoverRule**|Integer|True| |0自动恢复 1手动恢复|
|**switchRecoverRule**|Integer|True| |0自动恢复至主host 1手动恢复至主host|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|此次请求的ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
