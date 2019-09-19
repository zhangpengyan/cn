# 敏感操作支持列表：

目前定义的敏感操作列表如下：

#### 弹性计算
|  **云产品**  | **接口名称** | **接口描述** |
| :----------: | :--------------: | :------: |
| 云主机  |      vm:deleteInstance       |    删除云主机    |  
|     原生容器  |  nativecontainer:deleteContainer   |   删除容器实例  | 
|     Pod  |   pod:deletePod    |   删除Pod  | 
|     容器镜像仓库  |  containerregistry:deleteRegistry   |    删除注册表  |  
|     容器镜像仓库  | containerregistry:deleteRepository   |  删除镜像仓库  | 
|     容器镜像仓库  |  containerregistry:deleteImage   |    删除镜像 |  
|     Kubernetes集群  |   kubernetes:deleteCluster   |   删除集群| 
|    Kubernetes集群  |   kubernetes:deleteNodeGroup    |    删除工作节点组 | 
|     弹性伸缩  |   autoscaling:deleteAutoscalingGroup     |    删除伸缩组  | 
|    函数服务 |   function:deleteFunction   |    删除函数 | 

#### 数据库与缓存
|  **云产品**  | **接口名称** | **接口描述** |
| :----------: | :--------------: | :------: |
| 云数据库（My SQL）  |      rds:deleteDatabase     |    删除数据库    | 
| 云数据库（My SQL）  |     rds:deleteInstance    |   删除只读实例    | 
| 云数据库（My SQL）  |  rds:deleteInstance    |  删除实例   | 
|     云数据库（SQL Server） |  rds:deleteDatabase    |    删除数据库  |  
|     云数据库（SQL Server） |  rds:deleteInstance    |    删除实例|  
|     云数据库（SQL Server） | rds:restoreDatabaseFromFile   |  单库上云导入|  
|     云数据库（SQL Server） |rds:restoreDatabaseFromBackup |  单库恢复|  
|     云数据库MongoDB |  mongodb:deleteInstance   |    删除实例|  
|     DRDS |  drds:deleteInstance   |    删除实例|  
|     云缓存Redis|  redis:deleteCacheInstance  |    删除单个缓存Redis实例|  
|     云缓存Memcached |  memcached:deleteInstance  |    删除memcached单个实例|  

#### 存储
|  **云产品**  | **接口名称** | **接口描述** |
| :----------: | :--------------: | :------: |
| 云文件服务 |     zfs:deleteFileSystem   |  删除文件系统   | 

#### 边缘与加速
|  **云产品**  | **接口名称** | **接口描述** |
| :----------: | :--------------: | :------: |
| CDN  |     cdn:stopDomain   |    服务状态变更-停止服务   | 
| CDN  |      cdn:deleteDomain    |    服务状态变更-删除加速域名| 

#### 云安全
|  **云产品**  | **接口名称** | **接口描述** |
| :----------: | :--------------: | :------: |
| 应用安全网关  |      sgw:deleteWaf    |    删除WAF实例   | 
| SSL数字证书  |    ssl:deleteCerts    |    删除证书  | 
| SSL数字证书 |      ssl:downloadCert  |    下载证书  | 
| 云解析 |      clouddnsservice:setLock  |    开启/关闭域名锁定 | 

#### 管理
|  **云产品**  | **接口名称** | **接口描述** |
| :----------: | :--------------: | :------: |
| 资源编排 |      jdro:deleteStack  |    删除堆栈  | 
| 访问控制 |     iam:createSubUser |   创建子用户 | 
| 访问控制|     iam:deleteSubUser  |    删除子用户  | 

#### 开发者工具
|  **云产品**  | **接口名称** | **接口描述** |
| :----------: | :--------------: | :------: |
| 云部署|    deploy:deleteApp  |    删除应用 | 

#### 互联网中间件
|  **云产品**  | **接口名称** | **接口描述** |
| :----------: | :--------------: | :------: |
| 云搜索Elasticsearch |      es:deleteInstance  |    删除单个es实例  | 
| 云搜索Elasticsearch |     es:modifyInstanceSpec  |    变更es实例配置  | 
| 分布式服务框架 |     jdsf:deleteRegistry  |    删除注册中心集群  | 
| 分布式服务框架 |   jdsf:deleteTraceCluster |    删除调用链集群 | 
| 分布式服务框架 |    jdsf:deleteAppConfig |    删除应用配置 | 
| 分布式服务框架 |     jdsf:deleteAppConfigVersion |   删除应用配置版本  | 
| 分布式服务框架 |     jdsf:rollbackAppConfigVersion  |    回滚发布配置的版本  | 
| 消息队列 |   jcq:deleteTopic  |    删除单个Topic  | 
| 队列服务 |   jqs:deleteQueue  |  删除队列  | 

#### 超融合数据中心
|  **云产品**  | **接口名称** | **接口描述** |
| :----------: | :--------------: | :------: |
|云物理服务器 |    cps:restartInstance |   重启云物理服务器  | 
| 云物理服务器 |   cps:reinstallInstance  |   重装云物理服务器 | 
| 云物理服务器 |     cps:stopInstance  |    	云物理服务器关机  | 
|分布式云物理服务器 |  edcps:restartInstance |   重启分布式云物理服务器  | 
|分布式云物理服务器|   edcps:reinstallInstance |   重装分布式云物理服务器 | 
|分布式云物理服务器 |     edcps:stopInstance  |    	分布式云物理服务器关机  | 
