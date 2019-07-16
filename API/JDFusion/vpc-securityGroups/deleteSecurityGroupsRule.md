# deleteSecurityGroupsRule


## 描述
删除安全组规则

## 请求方式
DELETE

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_securityGroups/{id}/rule

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |安全组ID|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-cloudid**|String|True| |云注册信息ID|
|**ruleType**|String|True| |规则类型，ingress、egress|
|**protocol**|String|True| |协议，tcp、udp、icmp 或者 all|
|**fromPort**|String|True| |起始端口|
|**toPort**|String|True| |终止端口|
|**nicType**|String|False| |网络类型，internet、intranet|
|**policy**|String|False| |认证策略，accept、drop|
|**priority**|String|False| |认证策略的权重，1-100|
|**cidrIp**|String|False| |目标IP地址范围|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**204**|OK|
|**404**|securityGroup not found, or rule not found|
