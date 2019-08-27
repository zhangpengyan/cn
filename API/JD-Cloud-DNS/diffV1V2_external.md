### 术语

| 中文名字   | 英文名字                |
| ---------- | ----------------------- |
| 主域名     | Domain                  |
| 解析记录   | Resource Record，简称RR |
| 网站监控项 | Monitor                 |

云解析新SDK service code: domainservice

大多数接口只是更换接口名字，入参不需要改变。

部分接口资源类的ID放在URI里，入参需要稍作改变。例如更改解析记录接口modifyResourceRecord，解析记录ID参数放在URI里，入参需要加上RRId。

具体接口改动如下：

### 域名类接口

| v1接口名                                  | v2 接口名                          | 备注 |
| ----------------------------------------- | ---------------------------------- | --------- |
| getDomains 查询主域名                     | 请使用describeDomains接口 | 增加非可选参数domainName |
| addDomain添加主域名                       | createDomain                       | 只改动接口名字 |
| delDomain 删除主域名                      | deleteDomain           | domainId放在URI里 |
| updateDomain 修改主域名                   | modifyDomain                       | domainId放在URI里 |
| getDomainQueryCount 查看主域名的解析次数  | describeDomainQueryCount           | 只改动接口名字 |
| getDomainQueryTraffic  查看域名的查询流量 | describeDomainQueryTraffic         | 只改动接口名字 |
| getAllNoticeItem 查询警示信息             | describeNoticeItems                | 只改动接口名字 |



### 解析记录类接口

| v1接口名                          | v2 接口名                         | 备注                                            |
| --------------------------------- | --------------------------------- | ----------------------------------------------- |
| searchRR 查询主域名的解析记录     | describeResourceRecord            | 增加非可选参数search                            |
| addRR 添加主域名的解析记录        | createResourceRecord              | 只改动接口名字                                  |
| getViewTree  查询DNS所有解析线路  | describeViewTree                  | 只改动接口名字                                  |
| updateRR 修改域名的解析记录       | modifyResourceRecord              | RRId放在URI里                                   |
| operateRR  域名的解析记录的操作集 | deleteResourceRecord              | RRId放在URI里,  删除解析记录请使用此接口        |
| operateRR接口分为删除和其他的情况 | modifyResourceRecordStatus        | RRId放在URI里，改动解析记录的状态请使用此接口。 |
| setLB 设置域名解析记录的负载均衡  | createResourceRecordLoadBalance   | 只改动接口名字                                  |
| getLB查看的域名解析记录的负载均衡 | describeResourceRecordLoadBalance | 只改动接口名字                                  |



### 自定义线路接口

| v1接口名      | v2 接口名          | 备注              |
| ------------- | ------------------ | ----------------- |
| addUserView   | createUserView     | domainId放在URI里 |
| delUserView   | deleteUserView     | domainId放在URI里 |
| getUserView   | describeUserView   | domainId放在URI里 |
| addUserViewIP | createUserViewIP   | domainId放在URI里 |
| delUserViewIP | deleteUserViewIP   | domainId放在URI里 |
| getUserViewIP | describeUserViewIP | domainId放在URI里 |



### 网站监控

| v1接口名            | v2 接口名                | 备注 |
| ------------------- | ------------------------ | ------------------------ |
| getMonitor          | describeMonitor          | 只改动接口名字 |
| addMonitor          | createMonitor            | 只改动接口名字 |
| updateMonitor       | modifyMonitor            | 只改动接口名字 |
| getTargets          | describeSubDomainTargets | 只改动接口名字 |
| addMonitorTarget    | createMonitorTarget      | 只改动接口名字 |
| operateMonitor      | modifyMonitorStatus      | monitorId放在URI里，删除监控项使用此接口 |
|                     | deleteMonitor            | monitorId放在URI里，监控项的其他操作请使用此接口 |
| getMonitorAlarmInfo | describeMonitorAlarm | 只改动接口名字 |

### 其他接口

| v1接口名     | v2 接口名         | 备注           |
| ------------ | ----------------- | -------------- |
| getActionLog | describeActionLog | 只改动接口名字 |

