# createSecurityGroupsRule


## 描述
新增安全组规则

## 请求方式
POST

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
|**sgRule**|CreateSgRule|True| |新增安全组规则|

### CreateSgRule
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ruleType**|String|True| |规则类型，ingress、egress|
|**protocol**|String|True| |协议，tcp、udp、icmp 或者 all|
|**fromPort**|Integer|True| |起始端口|
|**toPort**|Integer|True| |终止端口|
|**securityGroupId**|String|True| |安全组ID|
|**nicType**|String|False| |网络类型，internet、intranet|
|**policy**|String|False| |认证策略，accept、drop|
|**priority**|Integer|False| |认证策略的权重，1-100。|
|**cidrIp**|String|True| |目标IP地址范围|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**task**|ResourceTFInfo| |
### ResourceTFInfo
|名称|类型|描述|
|---|---|---|
|**uuid**|String|uuid|
|**body**|String|请求体|
|**status**|String|状态|
|**result**|String|执行结果|
|**createdTime**|String|创建时间|
|**updateTime**|String|更新时间|
|**provider**|String|cloud provider|
|**cloudId**|String|cloud ID|
|**userId**|String|user ID|

## 返回码
|返回码|描述|
|---|---|
|**202**|ACCEPTED|
|**404**|securityGroup not found|
