# editDeployment


## 描述
修改部署信息

## 请求方式
PUT

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/deployments/{id}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |Deployment ID|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**deployment**|DeploymentInfo|True| |修改deployment|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|

### DeploymentInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**info**|DeploymentBaseInfo|False| | |
|**content**|DeploymentResourcesInfo|False| | |
### DeploymentResourcesInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**vms**|Object|False| | |
|**eips**|Object|False| | |
|**subnets**|Object|False| | |
|**networkInterfaces**|Object|False| | |
|**slbs**|Object|False| | |
|**securityGroups**|Object|False| | |
|**securityGroupRules**|Object|False| | |
|**keypairs**|Object|False| | |
|**disks**|Object|False| | |
|**vpcs**|Object|False| | |
|**vserverGroups**|Object|False| | |
|**httpListeners**|Object|False| | |
|**diskAttachment**|Object|False| | |
|**netInterfaceAttachment**|Object|False| | |
|**eipAssociate**|Object|False| | |
|**rds**|Object|False| | |
|**rdsDatabase**|Object|False| | |
|**rdsAccount**|Object|False| | |
|**rdsAccountGrant**|Object|False| | |
|**bucket**|Object|False| | |
|**variables**|Object|False| | |
### DeploymentBaseInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**cloudId**|String|False| |云ID|
|**version**|String|False| |版本|
|**readOnly**|Integer|False| |是否只读 0：否 1：是|
|**id**|String|False| |ID|
|**name**|String|False| |名称|
|**description**|String|False| |描述|
|**userId**|String|False| |用户ID|
|**createdTime**|String|False| |创建时间|
|**updatedTime**|String|False| |更新时间|
|**lastOperation**|String|False| |最近一次操作|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**deployment**|DeploymentInfo| |
### DeploymentInfo
|名称|类型|描述|
|---|---|---|
|**info**|DeploymentBaseInfo| |
|**content**|DeploymentResourcesInfo| |
### DeploymentResourcesInfo
|名称|类型|描述|
|---|---|---|
|**vms**|Object| |
|**eips**|Object| |
|**subnets**|Object| |
|**networkInterfaces**|Object| |
|**slbs**|Object| |
|**securityGroups**|Object| |
|**securityGroupRules**|Object| |
|**keypairs**|Object| |
|**disks**|Object| |
|**vpcs**|Object| |
|**vserverGroups**|Object| |
|**httpListeners**|Object| |
|**diskAttachment**|Object| |
|**netInterfaceAttachment**|Object| |
|**eipAssociate**|Object| |
|**rds**|Object| |
|**rdsDatabase**|Object| |
|**rdsAccount**|Object| |
|**rdsAccountGrant**|Object| |
|**bucket**|Object| |
|**variables**|Object| |
### DeploymentBaseInfo
|名称|类型|描述|
|---|---|---|
|**cloudId**|String|云ID|
|**version**|String|版本|
|**readOnly**|Integer|是否只读 0：否 1：是|
|**id**|String|ID|
|**name**|String|名称|
|**description**|String|描述|
|**userId**|String|用户ID|
|**createdTime**|String|创建时间|
|**updatedTime**|String|更新时间|
|**lastOperation**|String|最近一次操作|

## 返回码
|返回码|描述|
|---|---|
|**202**|ACCEPTED|
|**404**|not found|
