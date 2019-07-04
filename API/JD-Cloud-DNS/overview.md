# 京东云解析OpenAPI接口


## 简介
京东云解析OpenAPI接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**addDomain**|POST|添加主域名|
|**addMonitor**|POST|添加子域名的监控项，默认把子域名的所有监控项都添加上监控|
|**addMonitorTarget**|POST|添加子域名的某些特定监控对象为监控项|
|**addRR**|POST|添加域名的解析记录|
|**addUserView**|POST|添加域名的自定义解析线路|
|**addUserViewIP**|POST|添加域名的自定义解析线路的IP段|
|**batchSetDnsResolve**|POST|同一个主域名下，批量新增、更新导入解析记录<br></br>如果解析记录的ID为0，是新增解析记录，如果不为0，则是更新解析记录。</br>|
|**delDomain**|DELETE|删除主域名|
|**delUserView**|POST|删除域名的自定义解析线路|
|**delUserViewIP**|POST|删除域名的自定义解析线路的IP段|
|**getActionLog**|GET|查看用户在云解析服务下的操作记录|
|**getDomainQueryCount**|GET|查看域名的解析次数|
|**getDomainQueryTraffic**|GET|查看域名的查询流量|
|**getDomains**|GET|查询用户名下的主域名列表。<br>    </br>请在调用域名相关的API之前，调用此API获取相关的domainId和domainName。</br>|
|**getMonitor**|GET|查看主域名的监控项的配置以及状态|
|**getMonitorAlarmInfo**|GET|主域名的监控项的报警信息|
|**getTargets**|GET|查询子域名的可用监控对象|
|**getUserView**|GET|查询域名的自定义解析线路|
|**getUserViewIP**|GET|查询域名的自定义解析线路的IP段|
|**getViewTree**|GET|查询云解析所有的基础解析线路。<br></br>在使用解析线路的参数之前，请调用此接口获取解析线路的ID。</br>|
|**operateMonitor**|POST|监控项的操作集合，包括：删除，暂停，启动, 手动恢复, 手动切换|
|**operateRR**|POST|启用、停用、删除主域名下的解析记录|
|**searchRR**|GET|查询主域名的解析记录。<br></br>在使用解析记录相关的接口之前，请调用此接口获取解析记录的列表。</br>|
|**updateDomain**|POST|修改主域名|
|**updateMonitor**|POST|域名的监控项修改|
|**updateRR**|POST|修改主域名的某个解析记录|
