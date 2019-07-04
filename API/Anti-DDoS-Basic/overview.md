# Anti-DDoS Basic APIs


## 简介
DDoS 基础防护防护 IP、攻击记录相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**describeAttackLogs**|GET|查询攻击记录|
|**describeAttackStatistics**|GET|攻击情况统计|
|**describeAttackTypeCount**|GET|查询各类型攻击次数|
|**describeCpsIpResources**|GET|查询云物理服务器公网 IP 的安全信息. 包括云物理服务器的公网 IP 和弹性公网 IP.<br>|
|**describeElasticIpResources**|GET|查询私有网络的弹性公网 IP 的安全信息. 包括私有网络的弹性公网 IP(运营商级 NAT 保留地址除外)<br>|
|**describeIpCleanThresholdRange**|GET|查询公网 IP 可设置清洗阈值范围, 支持 ipv4 和 ipv6|
|**describeIpMonitorFlow**|GET|查询多个公网 IP 的监控流量, 支持 ipv4 和 ipv6|
|**describeIpResourceFlow**|GET|查询公网 IP 的 endTime 之前 15 分钟内监控流量, 仅支持 ipv4. (已废弃, 建议使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describeipmonitorflow">describeIpMonitorFlow</a> 接口)<br>|
|**describeIpResourceInfo**|GET|查询公网 IP 安全信息, 仅支持 ipv4. (已废弃, 建议使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describeipsafetyinfo">describeIpSafetyInfo</a> 接口)<br>|
|**describeIpResourceProtectInfo**|GET|查询公网 IP 的攻击记录, 仅支持 ipv4. (已废弃, 建议使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describeattacklogs">describeAttackLogs</a> 接口)<br>|
|**describeIpResources**|GET|查询公网 IP 的安全信息列表. 包括私有网络的弹性公网 IP(运营商级 NAT 保留地址除外), 云物理服务器的公网 IP 和弹性公网 IP. (已废弃, 建议使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describeelasticipresources">describeElasticIpResources</a>, <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describecpsipresources">describeCpsIpResources</a> 接口)"<br>|
|**describeIpSafetyInfo**|GET|查询基础防护已防护公网 IP 安全信息, 支持 ipv4 和 ipv6|
|**setCleanThreshold**|POST|设置基础防护已防护公网 IP 的清洗阈值, 仅支持 ipv4. (已废弃, 建议使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/setipcleanthreshold">setIpCleanThreshold</a> 接口)<br>|
|**setIpCleanThreshold**|POST|设置基础防护已防护公网 IP 的清洗阈值, 支持 ipv4 和 ipv6|
