## 访问控制
### 访问控制简介
访问控制（Identity and Access Management， IAM）的核心功能主要是用户身份管理与资源访问控制。用户可以通过使用IAM创建、管理子用户，并控制这些子用户访问京东云资源的操作权限。使用访问控制，主账号可以向他人授权管理账户中的资源，而不必共享账户密码或访问秘钥，按需为用户分配所需的最小权限，从而降低企业信息安全风险。</br>

云搜索Elasticsearch的访问控制功能是通过[访问控制 IAM]( https://docs.jdcloud.com/cn/iam/product-overview)来实现的，用户需要前往[访问控制菜单]( https://iam-console.jdcloud.com/summary)设置子账户和用户角色的权限。</br>

更多关于 IAM 的介绍可前往[IAM访问控制]( https://docs.jdcloud.com/cn/iam/product-overview)查看。</br>
### ES访问控制策略

#### 系统策略

ES已经预置2种系统策略，用户可以按需授权给子账户。系统预置策略如下：</br>

系统策略名称 | 权限描述 | 类型 | 资源范围 | 备注 
:---: | :--- | :--- | :--- | :---
JDCloudElasticSearchAdmin  | 云搜索Elasticsearch读权限 | 系统类型 | 主账号下云搜索Elasticsearch的所有资源 | 可以让用户拥有创建和管理 es所有集群实例的权限，包括访问Kibana的权限 |
JDCloudElasticSearchRead  | 云搜索Elasticsearch管理员权限 | 系统类型 | 主账号下云搜索Elasticsearch的所有资源 | 可以让用户拥有查看 ES 集群实例的权限，包括访问kibana的权限，但是不具有创建、删除等操作的权限。 |

#### 自定义策略

如果系统策略不能满足您的使用需求，可以参考访问控制的[操作指南]( https://docs.jdcloud.com/cn/iam/policy-management)，通过[自定义策略]( https://iam-console.jdcloud.com/policy/generator)授权给子账号对应的操作权限，目前ES支持的操作级别的权限如下：</br>

接口名称 | 权限描述 | 权限类型 | 资源范围 |  
:---: | :--- | :--- | :--- | 
describeInstanceConfigs  | 获取es配置信息 | 读取| 主账号下云搜索Elasticsearch的所有资源 |
describeInstanceConfig  | 根据版本获取es配置信息 | 读取 | 主账号下云搜索Elasticsearch的所有资源 |
describeInstances  | 查询es实例列表 | 读取| 主账号下云搜索Elasticsearch的所有资源 |
describeInstance | 查询es实例详情 | 读取 | 可选择主账号下云搜索Elasticsearch的部分资源 |
describeKibana  | 访问kibana | 读取| 可选择主账号下云搜索Elasticsearch的部分资源 |
describeDicts  | 获取es实例已上传的字典文件名 | 读取 | 可选择主账号下云搜索Elasticsearch的部分资源 |
describeInstanceNodes  | 获取es实例节点列表 | 读取| 可选择主账号下云搜索Elasticsearch的部分资源 |
describeAutoSnapshot  | auto snapshot 设置查询 | 读取 | 可选择主账号下云搜索Elasticsearch的部分资源 |
describeSnapshots  | 查询snapshot列表 | 读取| 可选择主账号下云搜索Elasticsearch的部分资源 |
createInstance  | 创建一个指定配置的es实例 | 写入 | 主账号下云搜索Elasticsearch的所有资源 |
deleteInstance  | 删除单个es实例 | 写入 | 可选择主账号下云搜索Elasticsearch的部分资源 |
modifyInstanceName | 修改es实例名称 | 写入 | 可选择主账号下云搜索Elasticsearch的部分资源 |
modifyInstanceSpec  | 变更es实例配置,3选一 | 写入 | 可选择主账号下云搜索Elasticsearch的部分资源 |
disableDicts  | 关闭自定义字典。同时清除用户已上传的字典 | 写入 | 可选择主账号下云搜索Elasticsearch的部分资源 |
uploadDict  | 上传本地字典文件并加载到es | 写入 | 可选择主账号下云搜索Elasticsearch的部分资源 |
deleteDict  | 删除单个字典文件 | 写入 | 可选择主账号下云搜索Elasticsearch的部分资源 |
createSnapshot  | 创建一个snapshot | 写入 | 可选择主账号下云搜索Elasticsearch的部分资源 |
modifyAutoSnapshot | auto snapshot 设置 | 写入 | 可选择主账号下云搜索Elasticsearch的部分资源 |
