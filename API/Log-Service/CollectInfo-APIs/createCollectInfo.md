# createCollectInfo


## 描述
创建采集配置，支持基于云产品模板生成采集模板；支持用于自定义采集配置。

## 请求方式
POST

## 请求地址
https://logs.jcloud.com/v1/regions/{regionId}/logtopics/{logtopicUID}/collectinfos

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**logtopicUID**|String|True| |日志主题 UID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**enabled**|Boolean|True| |采集状态，0-禁用，1-启用|
|**appCode**|String|True| |日志来源，只能是 custom/jdcloud|
|**serviceCode**|String|True| |产品线,当日志来源为jdcloud时，必填|
|**resourceType**|String|True| |采集实例类型, 只能是 all/part  当选择all时，传入的实例列表无效；custom类型的采集配置目前仅支持part方式，即用户指定实例列表；|
|**resources**|Resource[]|False| |采集实例列表：jdcloud类型最多添加20个资源；custom类型支持的资源数量不限；|
|**templateUID**|String|False| |日志类型。当appcode为jdcloud时为必填|
|**logPath**|String|False| |日志路径。当appcode为custom时为必填。目前仅支持对 Linux 云主机上的日志进行采集，路径支持通配符“*”和“？”，文件路径应符合 Linux 的文件路径规则|
|**logFile**|String|False| |日志文件名。当appcode为custom时为必填。日志文件名支持正则表达式。|
|**logFilters**|String[]|False| |过滤器。设置过滤器后可根据用户设定的关键词采集部分日志，如仅采集 Error 的日志。目前最大允许5个。|
|**filterEnabled**|Boolean|False| |过滤器是否启用。当appcode为custom时必填|

### Resource
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**region**|String|True| |资源所属地域|
|**resourceId**|String|True| |资源ID|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**uID**|String|UID|

## 返回码
|返回码|描述|
|---|---|
|**200**|创建采集配置结果|
