# 京东云解析OpenAPI接口


## 简介
京东云解析OpenAPI接口


### 版本
v2

## API

## 域名相关的API

| 接口名称                  | 请求方式 | 功能描述                   |
| ------------------------- | -------- | -------------------------- |
|**describeDomains**|GET|获取用户所属的主域名列表。   <br>请在调用域名相关的接口之前，调用此接口获取相关的domainId和domainName。  <br>主域名的相关概念，请查阅<a href="https://docs.jdcloud.com/cn/jd-cloud-dns/product-overview">云解析文档</a>|
|**createDomain**|POST|添加主域名  <br>如何添加免费域名，详细情况请查阅<a href="https://docs.jdcloud.com/cn/jd-cloud-dns/domainadd">文档</a><br>添加收费域名，请查阅<a href="https://docs.jdcloud.com/cn/jd-cloud-dns/purchase-process">文档</a>，<br>添加收费域名前，请确保用户的京东云账户有足够的资金支付，Openapi接口回返回订单号，可以用此订单号向计费系统查阅详情。<br>|
|**modifyDomain**|PUT|修改主域名|
|**deleteDomain**|DELETE|删除主域名|
|**describeDomainQueryCount**|GET|查看主域名的解析次数|
|**describeDomainQueryTraffic**|GET|查看域名的查询流量|
## 解析记录相关的API

| 接口名称        | 请求方式 | 功能描述                           |
| --------------- | -------- | ---------------------------------- |
|**describeResourceRecord**|GET|查询主域名的解析记录。  <br>在使用解析记录相关的接口之前，请调用此接口获取解析记录的列表。<br>|
|**describeViewTree**|GET|查询云解析所有的基础解析线路。  <br>在使用解析线路的参数之前，请调用此接口获取解析线路的ID。|
|**createResourceRecord**|POST|添加主域名的解析记录|
|**batchSetDnsResolve**|POST|同一个主域名下，批量新增、更新导入解析记录<br></br>如果解析记录的ID为0，是新增解析记录，如果不为0，则是更新解析记录。</br>|
|**modifyResourceRecord**|PUT|修改主域名的某个解析记录|
|**modifyResourceRecordStatus**|PUT|启用、停用主域名下的解析记录|
|**deleteResourceRecord**|DELETE|删除主域名下的解析记录|
|**describeUserView**|GET|查询主域名的自定义解析线路|
|**describeUserViewIP**|GET|查询主域名的自定义解析线路的IP段|
|**createUserView**|POST|添加主域名的自定义解析线路|
|**createUserViewIP**|POST|添加主域名的自定义解析线路的IP段|
|**deleteUserView**|POST|删除主域名的自定义解析线路|
|**deleteUserViewIP**|POST|删除主域名的自定义解析线路的IP段|

## 网站监控相关的API

| 接口名称                | 请求方式 | 功能描述                                                     |
| ----------------------- | -------- | ------------------------------------------------------------ |
|**describeMonitor**|GET|查看主域名的监控项的配置以及状态|
|**describeMonitorAlarm**|GET|主域名的监控项的报警信息|
|**describeMonitorTarget**|GET|查询子域名的可用监控对象|
|**createMonitor**|POST|添加子域名的监控项，默认把子域名的所有监控项都添加上监控|
|**createMonitorTarget**|POST|添加子域名的某些特定监控对象为监控项|
| **addMonitorTarget**    | POST     | 添加子域名的某些特定监控对象为监控项                         |
|**modifyMonitor**|PUT|域名的监控项修改|
|**modifyMonitorStatus**|PUT|监控项的操作集合，包括：暂停，启动, 手动恢复, 手动切换|
|**deleteMonitor**|DELETE|监控项的删除|
## 操作记录日志的API

| 接口名称                | 请求方式 | 功能描述                                                     |
| ----------------------- | -------- | ------------------------------------------------------------ |
|**describeActionLog**|GET|查看用户在云解析服务下的操作记录|