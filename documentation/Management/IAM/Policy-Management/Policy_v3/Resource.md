# 资源描述方式

## JRN的描述方式

所有资源均可采用下述的五段式描述方式：

```JSON
jrn:<service_name>:<region>:<accountId>:<resourceType>/<resourceId><subresouceType>/<subresouceId>
```

## 格式说明

- jrn是 JDCloud Resource Name 的简称，表示这是京东云的云资源。该字段是必填项。
- service_name 描述产品简称，该字段是必填项，可用 * 表示全部产品线。service name具体事例，详见支持IAM的云服务。
- region 描述地域信息。若云产品不区分地域，该字段直接留空；若云产品区分地域，该字段是必填项，可用*表示全部region，现有的地域命名方式定义如下：

|  **Region**  | **JRN中Region标识** |
| :----------: | :-----------------: |
|  华北-北京   |     cn-north-1      |
|  华东-宿迁   |      cn-east-1      |
|  华东-上海   |      cn-east-2      |
|  华南-广州   |     cn-south-1      |
| 公网（华北） |  cn-north-internet  |

- AccountID描述资源拥有者的主账号信息，每个主账号有一个12位数字组成的号码，从用户中心 > 基本资料中可以查看AccountID。

- ` <resourceType>/<resourceId>/<subresouceType>/<subresouceId>` ， Resource Type为产品线Open API中的一级资源，Resource ID为产品线Open API中的一级资源ID，Subresource Type为产品线Open API中的二级资源，Subresouce ID为产品线Open API中二级资源ID，如果后续产品线需要支持三级，四级资源时，则用 / 来进行分隔即可。可用 * 来表示全部资源。

**JRN示例：**

| **描述**                                             | **JRN示例**                                                  |
| :--------------------------------------------------- | :----------------------------------------------------------- |
| 指定用户下，指定产品线中的全部资源                   | jrn:sgw:\*:859150329790:*                                    |
| 指定用户下，指定产品线中，指定region下的全部资源     | jrn:sgw:cn-north-1:859150329790:*                            |
| 指定用户下，指定产品线中，指定region下的单个资源     | jrn:sgw:cn-north-1:859150329790:instances/waf-yr9w9sr40      |
| 指定用户下，指定产品线中，指定region下的单个二级资源 | jrn:sgw:cn-north-1:859150329790:database/mysql-ow3z4pnmm2/table/billing |

## 支持IAM的产品线JRN示例

### 弹性计算

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 云硬盘      | jrn:disk:regionId:accountId:snapshots/{snapshotId}<br>jrn:disk:regionId:accountId:disks/{diskId}|
| 原生容器      | jrn:nativecontainer:regionId:accountId:secrets/{name}<br>jrn:nativecontainer:regionId:accountId:containers/{containerId}|
| POD        | jrn:pod:regionId:accountId:pods/{podId}<br>jrn:pod:regionId:accountId:pods/{podId}/containers/{containerName}<br>jrn:pod:regionId:accountId:secrets/{name} |
|Kubernetes集群  |jrn:kubernetes:regionId:accountId:clusters/{clusterId}<br>jrn:kubernetes:regionId:accountId:clusters/{clusterId}/nodeGroups/{nodeGroupId}|
|容器镜像仓库       |jrn:containerregistry:regionId:accountId:registries/{registryName}<br>jrn:containerregistry:regionId:accountId:registries/{registryName}/repositories/{repositoryName}|
|函数服务      |jrn:function:regionId:accountId:functions/{functionName}|

### 网络

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 负载均衡   | jrn:lb:regionId:accountId:loadBalancers/{loadBalancerId}<br>jrn:lb:regionId:accountId:loadBalancers/{loadBalancerId}/backends/{backendId}<br>jrn:lb:regionId:accountId:loadBalancers/{loadBalancerId}/listeners/{listenerId}<br>jrn:lb:regionId:accountId:loadBalancers/{loadBalancerId}/targetGroups/{targetGroupId}<br>jrn:lb:regionId:accountId:loadBalancers/{loadBalancerId}/urlMaps/{urlMapId} |


### 数据库与缓存

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 云数据库RDS |jrn:rds:regionId:accountId:instances/{instanceId}<br>jrn:rds:regionId:accountId:instances/{instanceId}/accounts/{accountName}<br>jrn:rds:regionId:accountId:instances/{instanceId}/databases/{dbName}<br>jrn:rds:regionId:accountId:instances/{instanceId}/backups/{backupId}<br>jrn:rds:regionId:accountId:backups/{backupId}<br>jrn:rds:regionId:accountId:instances/{instanceId}/importFiles/{fileName}<br>jrn:rds:regionId:accountId:instances/{instanceId}/binlogs/{binlogBackupId}<br>jrn:rds:regionId:accountId:parameterGroups/{parameterGroupId} |
| 云数据库MongoDB | jrn:mongodb:regionId:accountId:instances/{instanceId}<br>jrn:mongodb:regionId:accountId:backups/{backupId}<br>jrn:mongodb:regionId:accountId:backupSynchronicities/{serviceId}|
| 分布式关系型数据库（DRDS） | jrn:drds:regionId:accountId:instances/{instanceId}<br>jrn:drds:regionId:accountId:instances/{instanceId}/task/{taskId}<br>jrn:drds:regionId:accountId:instances/{instanceId}/databases/{databaseName}<br>jrn:drds:regionId:accountId:instances/{instanceId}/accounts/{accountName}|
| 云缓存Redis | jrn:redis:regionId:accountId:cacheInstance/{cacheInstanceId}|
| 云缓存Memcached | jrn:memcached:regionId:accountId:instances/{instanceId} |

### 存储

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 对象存储     | jrn:oss:regionId:accountId:{BucketName} <br> jrn:oss:regionId:accountId:{BucketName}/{ObjectName}|
| 云文件服务    | jrn:zfs:regionId:accountId:fileSystems/{fileSystemId} <br> jrn:zfs:regionId:accountId:fileSystems/{fileSystemId}/mountTargets/{mountTargetId}|

### 边缘与加速

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| CDN| jrn:cdn::accountId:domain/{domain}<br>jrn:cdn::accountId:liveDomain/{domain}<br>jrn:cdn::accountId:domainGroup/{id}|

### 云安全

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| DDoS基础防护      |   jrn:baseanti:regionId:accountId:ipResources/{ip}   |
|DDoS防护包      |   	jrn:antipro:regionId:accuntId:instances/{instanceId}  |
|Web应用防火墙     |  jrn:waf:regionId:accountId:wafInstanceIds/{wafInstanceId}   |
|IP高防    | 	jrn:ipanti::accooutId:instances/{instanceId} <br>jrn:ipanti::accooutId:instances/{instanceId}/webRules/{webRuleId}<br>jrn:ipanti::AccooutId:instances/{instanceId}/ipSets/{ipSetId}<br>jrn:ipanti::AccooutId:instances/{instanceId}/forwardRules/{forwardRuleId}|
| 应用安全网关 | jrn:sgw:regionId:accountId:instances/{instanceId} |
|主机安全    |  *   |
|态势感知   |   *  |
| SSL数字证书 |jrn:ssl::accountId:sslCert/{certId}<br>jrn:ssl::accountId:sslRecord/{recordId}|
|密钥管理服务   |  	jrn:kms::accountId:key/{keyId}<br>jrn:kms::accountId:key/{keyId}/version/{version}<br>jrn:kms::accountId:secret/{secretId}<br>jrn:kms::accountId:secret/{secretId}/version/{version}|
|网站威胁扫描    |  *   |

### 管理

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 云监控 |* |
| 资源编排|jrn:jdro:regionId:accountId:stacks/{stackId}|
| 目录服务        |jrn:directoryservice:regionId:accountId:directory/{directoryId}   |
| 日志服务|jrn:logs:regionId:accountId:logsets/{logsetUID}<br>jrn:logs:regionId:accountId:logsets/{logsetUID}/logtopics/{logtopicUID}<br>jrn:logs:regionId:accountId:logsets/{logsetUID}/logtopics/{logtopicUID}//shippers/{shipperUID}<br>jrn:logs:regionId:accountId:logsets/{logsetUID}/logtopics/{logtopicUID}/collectinfos/{collectInfoUID}|
| 操作审计|* |
| 访问控制|jrn:iam::accountId:group/{groupName} <br>jrn:iam::accountId:policy/{policyName}<br>jrn:iam::accountId:role/{roleName}<br>jrn:iam::accountId:subUser/{subUser}|
| 安全令牌服务 | jrn:iam::accountId:role/{roleName}|
| 续费管理|* |
| 标签管理|* |

### 域名与备案

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 云解析DNS|jrn:domainservice::accountId:domain/{domainId}<br>jrn:domainservice::AccountId:domain/{domainId}/monitor/{monitorId}<br>jrn:domainservice:accountId:domain/{domainId}/ResourceRecord/{resourceRecordId}|
| HTTPDNS|* |

### 视频服务

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 视频点播|* |
| 视频直播|* |

### 大数据与分析

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 数据工厂2.0|* |

### 互联网中间件

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 消息队列JCQ      | jrn:jcq:regionId:accountId:/topics/{topicName<br>jrn:jcq:regionId:accountId:/topics/{topicName}/subscriptions/{consumerGroupId} |
| API网关 | jrn:apigateway:regionId:accountId:accessAuths/{accessAuthId} <br>jrn:apigateway:regionId:accountId:accessKeys/{accessKeyId}<br>jrn:apigateway:regionId:accountId:apiGroups/{apiGroupId}<br>jrn:apigateway:regionId:accountId:apiGroups/{apiGroupId}/deployments/{deploymentId}<br>jrn:apigateway:regionId:accountId:apiGroups/{apiGroupId}/revision/{revisionId}<br>jrn:apigateway:regionId:accountId:rateLimitPolicies/{policyId}<br>jrn:apigateway:regionId:accountId:subscriptionKeys/{subscriptionKeyId}|
| 云搜索Elasticsearch  |  ``jrn:es:regionId:accountId:instances/{instanceId}`` |
| 队列服务 |jrn:jqs:regionId:accountId:queue/{queueId}  |
| 微服务平台 | jrn:jdsf:regionId:accountId:registries/{registryId}<br>jrn:jdsf:regionId:accountId:registries/{registryId}/services/{serviceName}<br>jrn:jdsf:regionId:accountId:registries/{registryId}/services/{serviceName}/instances/{instanceId}<br>jrn:jdsf:regionId:accountId:traces/{instanceId}<br>jrn:jdsf:regionId:accountId:traces/{instanceId}/services/{serviceName}<br>jrn:jdsf:regionId:accountId:traces/{instanceId}/tracings/{traceId}<br>jrn:jdsf:regionId:accountId:appconfig/{appConfigId}<br>jrn:jdsf:regionId:accountId:appconfig/{appConfigId}/versions/{appConfigVersionId}/publishes/{appConfigPublishVersionId}<br>jrn:jdsf:regionId:accountId:deployapps/{appId} |

### 超融合数据中心

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 云物理服务器|jrn:cps:regionId:accountId:instances/{instanceId} |
| 云托管服务|* |

### 费用中心

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 订单管理|* |
| 发票管理|* |
| 消费管理|* |
| 消费预测|* |
| 结算管理|* |
| 资金管理|* |

### 渠道管理

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 渠道管理|* |


### 开发者工具

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 代码托管|* |
| 云编译|	jrn:compile:regionId:accountId:jobs/{id}<br>jrn:compile:regionId:accountId:jobs/{id}/builds/{id}<br>jrn:compile:regionId:accountId:repos/{name}<br>jrn:compile:regionId:accountId:repos/{name}/hooks/{id}<br>jrn:compile:regionId:accountId:codes/{type}<br>jrn:compile:regionId:accountId:codes/{type}/accessToken/{accessToken}<br>jrn:compile:regionId:accountId:codes/{type}/branches/{branchName}|
| 云部署|jrn:deploy:regionId:accoutId:app/{appId} <br>jrn:deploy:regionId:accoutId:app/{appId}/group/{groupId}<br>jrn:deploy:regionId:accoutId:app/{appId}/group/{groupId}/deploy/{deployId}<br>jrn:deploy:regionId:accoutId:app/{appId}/milestone/{milestoneId} |
| 流水线|jrn:pipeline:regionId:accoutId:pipeline/{uuid}<br>jrn:pipeline:regionId:accoutId:pipeline/{uuid}/instance/{instanceUuid}<br>jrn:pipeline:regionId:accoutId:pipeline/{uuid}/instance/{instanceUuid}/actions/{actionUuid}|

### 物联网

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 物联网引擎|* |
| 物联网协议适配|*	|
