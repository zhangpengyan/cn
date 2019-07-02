# JCLOUD MONITOR API


## 简介
monitor API


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**createAlarm**|POST|创建报警规则，可以为某一个实例创建报警规则，也可以为多个实例同时创建报警规则。|
|**deleteAlarms**|DELETE|批量删除规则|
|**deleteAlarmsCm**|DELETE|删除自定义监控规则|
|**describeAlarmContacts**|GET|查询规则的报警联系人|
|**describeAlarmHistory**|GET|查询报警历史</br>检索条件组合优先级从高到低为</br>1. alarmId</br>2. serviceCode</br>2.1 serviceCode + resourceId</br>2.2 serviceCode + resourceIds</br>3. serviceCodes</br>4. 用户所有规则|
|**describeAlarmHistoryAllRegion**|POST|查询报警历史</br>检索条件组合优先级从高到低为</br>1. alarmId</br>2. serviceCode</br>2.1 serviceCode + resourceId</br>2.2 serviceCode + resourceIds</br>3. serviceCodes</br>4. 用户所有规则|
|**describeAlarms**|GET|查询规则, 查询参数组合及优先级从高到低为：</br>1：alarmId不为空</br>2：serviceCode不为空</br>2.1：serviceCode + resourceId</br>2.2: serviceCode + resourceIds</br>3：serviceCodes不为空</br>4: 所有规则|
|**describeAlarmsByID**|GET|查询规则详情|
|**describeMetricData**|GET|查看某资源多个监控项数据，metric介绍1：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>|
|**describeMetrics**|GET|根据产品线查询可用监控项列表,metric介绍：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>|
|**describeMetricsForCreateAlarm**|GET|查询可用创建监控规则的指标列表,metric介绍：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>|
|**disableAlarm**|POST|禁用报警规则。报警规则禁用后，将停止探测实例的监控项数据。|
|**enableAlarm**|POST|启用报警规则，当客户的报警规则处于停止状态时，可以使用此接口启用报警规则。|
|**lastDownsample**|GET|查看某资源的最后一个点,metric介绍：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>|
|**putMetricData**|POST|该接口为自定义监控数据上报的接口，方便您将自己采集的时序数据上报到云监控。不同region域名上报不同region的数据，参考：<a href="https://docs.jdcloud.com/cn/monitoring/reporting-monitoring-data">调用说明</a>可上报原始数据和已聚合的统计数据。支持批量上报方式。单次请求最多包含 50 个数据点；数据大小不超过 256k。|
|**updateAlarm**|PATCH|修改已创建的报警规则|
