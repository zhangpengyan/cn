# 京东云IP高防相关接口


## 简介
京东云IP高防相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**checkName**|GET|检测实例名称是否合法|
|**createBlackListRuleOfWebRule**|POST|添加网站类规则的黑名单规则|
|**createCCProtectionRuleOfWebRule**|POST|添加网站类规则的 CC 防护规则|
|**createForwardRule**|POST|添加非网站类规则|
|**createInstance**|POST|新购或升级高防实例|
|**createIpSet**|POST|添加实例的 IP 黑白名单, 预定义的 IP 黑白名单绑定到转发规则的黑名单或白名单后生效|
|**createWebRule**|POST|添加网站类规则|
|**createWhiteListRuleOfWebRule**|POST|添加网站类规则的白名单规则|
|**deleteBlackListRuleOfWebRule**|DELETE|删除网站类规则的黑名单规则, 批量操作时 webBlackListRuleId 传多个, 以 ',' 分隔, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败|
|**deleteCCProtectionRuleOfWebRule**|DELETE|删除网站规则的 CC 防护规则|
|**deleteForwardRule**|DELETE|删除非网站规则, 批量操作时, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败|
|**deleteIpSet**|DELETE|删除实例的 IP 黑白名单. 支持批量操作, 批量操作时 ipSetId 传多个, 以 ',' 分隔. IP 黑白名单规则被引用时不允许删除|
|**deleteWebRule**|DELETE|删除网站规则。支持批量操作, 批量操作时 webRuleId 传多个, 以 ',' 分隔, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败|
|**deleteWhiteListRuleOfWebRule**|DELETE|删除网站类规则的白名单规则, 批量操作时 webWhiteListRuleId 传多个, 以 ',' 分隔, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败|
|**describeAlarmConfig**|GET|查询告警配置|
|**describeAttackStatistics**|GET|查询攻击次数及流量峰值|
|**describeAttackTypeCount**|GET|查询各类型攻击次数|
|**describeBlackListRuleOfForwardRule**|GET|查询转发规则的黑名单规则|
|**describeBlackListRuleOfWebRule**|GET|查询网站类规则的黑名单规则|
|**describeBlackListRulesOfWebRule**|GET|查询网站类规则的黑名单规则列表|
|**describeCCAttackLogDetails**|GET|查询 CC 攻击日志详情.<br>- 参数 attackId 优先级高于 instanceId, attackId 不为空时, 忽略 instanceId<br>|
|**describeCCAttackLogs**|GET|查询 CC 攻击日志|
|**describeCCGraph**|GET|CC 防护流量报表|
|**describeCCProtectionConfigOfWebRule**|GET|查询网站类规则的 CC 防护配置|
|**describeCCProtectionDefaultConfigOfWebRule**|GET|查询网站类规则的 CC 防护默认配置|
|**describeCCProtectionRuleOfWebRule**|GET|查询网站类规则的 CC 防护规则|
|**describeCCProtectionRulesOfWebRule**|GET|查询网站类规则的 CC 防护规则列表|
|**describeCpsIpList**|GET|查询用户可设置为网站类规则回源 IP 的京东云云物理服务器公网 IP 资源|
|**describeDDoSAttackLogs**|GET|查询 DDoS 攻击日志|
|**describeDDoSGraph**|GET|DDos 防护流量报表|
|**describeForwardRule**|GET|查询非网站类规则|
|**describeForwardRules**|GET|查询某个实例下的非网站转发配置|
|**describeFwdGraph**|GET|转发流量报表|
|**describeGeoAreas**|GET|查询非网站类转发规则的防护规则 Geo 拦截可设置区域编码|
|**describeInstance**|GET|查询实例|
|**describeInstances**|GET|查询实例列表|
|**describeIpSet**|GET|查询实例的 IP 黑白名单|
|**describeIpSetUsage**|GET|查询实例的 IP 黑白名单用量信息|
|**describeIpSets**|GET|查询实例的 IP 黑白名单库列表|
|**describeNameList**|GET|查询高防实例名称列表|
|**describeProtectionRuleOfForwardRule**|GET|查询非网站类转发规则的防护规则|
|**describeProtectionStatistics**|GET|查询高防实例防护统计信息|
|**describeVpcIpList**|GET|查询用户可设置为网站类规则回源 IP 的京东云云内弹性公网 IP 资源|
|**describeWebRule**|GET|查询网站类规则|
|**describeWebRuleBlackListGeoAreas**|GET|查询网站类转发规则 Geo 模式的黑名单可设置区域编码|
|**describeWebRuleBlackListUsage**|GET|查询网站类防护规则的黑名单用量信息|
|**describeWebRuleWhiteListGeoAreas**|GET|查询网站类转发规则 Geo 模式的白名单可设置区域编码|
|**describeWebRuleWhiteListUsage**|GET|查询网站类防护规则的白名单用量信息|
|**describeWebRules**|GET|查询某个实例下的网站类规则|
|**describeWhiteListRuleOfForwardRule**|GET|查询转发规则的白名单规则|
|**describeWhiteListRuleOfWebRule**|GET|查询网站类规则的白名单规则|
|**describeWhiteListRulesOfWebRule**|GET|查询网站类规则的白名单规则列表|
|**disableBlackListRuleOfForwardRule**|POST|关闭转发规则的黑名单规则|
|**disableBlackListRuleOfWebRule**|POST|关闭网站类规则的黑名单规则, 批量操作时 webBlackListRuleId 传多个, 以 ',' 分隔, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败|
|**disableCCProtectionRuleOfWebRule**|POST|关闭网站类规则的 CC 防护规则|
|**disableWebRuleBlackList**|POST|关闭网站类规则的黑名单|
|**disableWebRuleCC**|POST|关闭网站类规则 CC 防护, 网站类规则的 CC 防护规则和 CC 防护配置失效。支持批量操作, 批量操作时 webRuleId 传多个, 以 ',' 分隔, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败|
|**disableWebRuleCCObserverMode**|POST|关闭网站类规则 CC 观察者模式, 观察模式下, CC 防护只告警不防御。支持批量操作, 批量操作时 webRuleId 传多个, 以 ',' 分隔, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败|
|**disableWebRuleWhiteList**|POST|关闭网站类规则的白名单|
|**disableWhiteListRuleOfForwardRule**|POST|关闭转发规则的白名单规则|
|**disableWhiteListRuleOfWebRule**|POST|关闭网站类规则的白名单规则, 批量操作时 webWhiteListRuleId 传多个, 以 ',' 分隔, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败|
|**enableBlackListRuleOfForwardRule**|POST|开启转发规则的黑名单规则|
|**enableBlackListRuleOfWebRule**|POST|开启网站类规则的黑名单规则, 批量操作时 webBlackListRuleId 传多个, 以 ',' 分隔, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败|
|**enableCCProtectionRuleOfWebRule**|POST|开启网站类规则的 CC 防护规则|
|**enableWebRuleBlackList**|POST|开启网站类规则的黑名单|
|**enableWebRuleCC**|POST|网站类规则开启 CC 防护, 开启后网站类规则已配置的防护规则和 CC 防护配置生效, 若没有配置过 CC 防护, 默认的 CC 防护配置生效。支持批量操作, 批量操作时 webRuleId 传多个, 以 ',' 分隔, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败|
|**enableWebRuleCCObserverMode**|POST|开启网站类规则 CC 观察者模式, 观察模式下, CC 防护只告警不防御。支持批量操作, 批量操作时 webRuleId 传多个, 以 ',' 分隔, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败|
|**enableWebRuleWhiteList**|POST|开启网站类规则的白名单|
|**enableWhiteListRuleOfForwardRule**|POST|开启转发规则的白名单规则|
|**enableWhiteListRuleOfWebRule**|POST|开启网站类规则的白名单规则, 批量操作时 webWhiteListRuleId 传多个, 以 ',' 分隔, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败|
|**modifyAlarmConfig**|POST|更新告警配置|
|**modifyBlackListRuleOfForwardRule**|PATCH|修改转发规则的黑名单规则|
|**modifyBlackListRuleOfWebRule**|PATCH|修改网站类规则的黑名单规则|
|**modifyCCProtectionConfigOfWebRule**|PATCH|修改网站类规则的 CC 防护配置|
|**modifyCCProtectionRuleOfWebRule**|PATCH|修改网站类规则的 CC 防护规则|
|**modifyCertInfo**|POST|编辑网站规则证书信息|
|**modifyEPB**|POST|更新实例弹性防护带宽|
|**modifyForwardRule**|PATCH|更新非网站类规则|
|**modifyInstanceName**|POST|修改实例名称|
|**modifyProtectionRuleOfForwardRule**|POST|修改非网站类转发规则的防护规则|
|**modifyWebRule**|PATCH|修改网站类规则|
|**modifyWhiteListRuleOfForwardRule**|PATCH|修改转发规则的白名单规则|
|**modifyWhiteListRuleOfWebRule**|PATCH|修改网站类规则的白名单规则|
|**switchForwardRuleOrigin**|POST|非网站类规则切换成回源状态|
|**switchForwardRuleProtect**|POST|非网站类规则切换成防御状态|
|**switchWebRuleOrigin**|POST|网站类规则切换成回源状态|
|**switchWebRuleProtect**|POST|网站类规则切换成防御状态|
