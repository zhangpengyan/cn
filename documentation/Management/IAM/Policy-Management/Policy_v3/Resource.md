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

JRN示例：

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
| POD        | jrn:pod:regionId:accountId:pods/{podId}<br>jrn:pod:regionId:accountId:pods/{podId}/containers/{containerName}<br/>jrn:pod:regionId:accountId:secrets/{name} |
|容器镜像仓库       |jrn:containerregistry:regionId:accountId:registries/{registryName}<br>jrn:containerregistry:regionId:accountId:registries/{registryName}/repositories/{repositoryName}|

### 网络

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 负载均衡   | jrn:lb:regionId:accountId:loadBalancers/{loadBalancerId}<br>jrn:lb:regionId:accountId:loadBalancers/{loadBalancerId}/backends/{backendId}<br>jrn:lb:regionId:accountId:loadBalancers/{loadBalancerId}/listeners/{listenerId}<br>jrn:lb:regionId:accountId:loadBalancers/{loadBalancerId}/targetGroups/{targetGroupId}<br>jrn:lb:regionId:accountId:loadBalancers/{loadBalancerId}/urlMaps/{urlMapId} |


### 数据库与缓存

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 云缓存Memcached | jrn:memcached:regionId:accountId:instances/{instanceId} |

### 存储

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 对象存储     | jrn:oss:regionId:accountId:{BucketName} <br> jrn:oss:regionId:accountId:{BucketName}/{ObjectName}|

### 边缘与加速

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| CDN| jrn:cdn::accountId:domain/{domain}<br>jrn:cdn::accountId:liveDomain/{domain}<br>jrn:cdn::accountId:domainGroup/{id}|

### 云安全

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| DDoS         |   jrn:baseanti:regionId:accountId:ipResources/{ip}   |
| 应用安全网关 | jrn:sgw:regionId:accountId:instances/{instanceId} |
| SSL数字证书 |jrn:ssl::accountId:sslCert/{certId}<br>jrn:ssl::accountId:sslRecord/{recordId}|

### 管理

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 目录服务        |   jrn:directoryservice:regionId:accountId:directory/{directoryId}   |
| 安全令牌服务 | jrn:iam::accountId:role/{roleName}|

### 互联网中间件

| 产品线名称 |                           JRN示例                            |
| :---------: | :---------------------------------------------------------- |
| 消息队列JCQ      | jrn:jcq:regionId:accountId:/topics/{topicName<br>jrn:jcq:regionId:accountId:/topics/{topicName}/subscriptions/{consumerGroupId} |
| 云搜索Elasticsearch  |  ``jrn:es:regionId:accountId:instances/{instanceId}`` |
| 分布式服务框架 | jrn:jdsf:regionId:accountId:registries/{registryId}<br>jrn:jdsf:regionId:accountId:registries/{registryId}/services/{serviceName}<br>jrn:jdsf:regionId:accountId:registries/{registryId}/services/{serviceName}/instances/{instanceId}<br>jrn:jdsf:regionId:accountId:traces/{instanceId}<br>jrn:jdsf:regionId:accountId:traces/{instanceId}/services/{serviceName}<br>jrn:jdsf:regionId:accountId:traces/{instanceId}/tracings/{traceId}<br>jrn:jdsf:regionId:accountId:appconfig/{appConfigId}<br>jrn:jdsf:regionId:accountId:appconfig/{appConfigId}/versions/{appConfigVersionId}/publishes/{appConfigPublishVersionId}<br>jrn:jdsf:regionId:accountId:deployapps/{appId} |
