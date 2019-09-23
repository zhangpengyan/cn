# JCLOUD LOGS API


## 简介
logs API


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**createCollectInfo**|POST|创建采集配置，支持基于云产品模板生成采集模板；支持用于自定义采集配置。|
|**createLogset**|POST|创建日志集。名称不可重复。|
|**createLogtopic**|POST|创建日志主题，不可与当前日志集下现有日志主题重名。|
|**deleteLogset**|DELETE|删除日志集,删除多个日志集时，任意的日志集包含了日志主题的，将导致全部删除失败。|
|**deleteLogtopic**|DELETE|删除日志主题。其采集配置与采集实例配置将一并删除。|
|**describeCollectInfo**|GET|采集配置的基本信息。|
|**describeCollectResources**|GET|查询采集配置的实例列表|
|**describeLogset**|GET|查询日志集详情。|
|**describeLogsets**|GET|查询日志集列表。支持按照名称进行模糊查询。结果中包含了该日志集是否存在日志主题的信息。存在日志主题的日志集不允许删除。|
|**describeLogtopic**|GET|查询日志主题基本信息。如配置了采集配置，将返回采集配置的UID|
|**describeLogtopics**|GET|查询日志主题列表，支持按照名称模糊查询。|
|**updateCollectInfo**|PUT|更新采集配置。若传入的实例列表不为空，将覆盖之前的所有实例，而非新增。|
|**updateCollectResources**|POST|增量更新采集实例列表。更新的动作支持 add 、 remove|
|**updateLogset**|PUT|更新日志集。日志集名称不可更新。|
|**updateLogtopic**|PUT|更新日志主题。日志主题名称不可更新。|
