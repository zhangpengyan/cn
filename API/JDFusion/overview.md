# testJDFusion


## 简介
云主机、网卡、云硬盘、网络与相关、关系型数据库、对象存储等相关的接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**applyDeployment**|POST|应用部署|
|**associateVpcEipById**|PUT|弹性公网IP绑定到虚拟机|
|**attachDiskToVmInstanceByDiskId**|PUT|云硬盘挂载至虚拟机|
|**attachVpcNetworkInterfaceById**|PUT|网卡挂载虚拟机|
|**cloneDeployment**|PUT|克隆部署信息|
|**createBucket**|POST|根据给定的信息，创建OSS存储桶|
|**createChannel**|POST|创建数据同步通道|
|**createDatasource**|POST|创建数据源|
|**createDeployment**|POST|创建部署信息|
|**createDisk**|POST|根据云提供商创建云硬盘|
|**createRdsAccounts**|POST|根据给定的信息，创建指定RDS实例的账户|
|**createRdsDatabase**|POST|根据给定的信息，创建指定RDS实例的数据库|
|**createRdsInstance**|POST|根据给定的信息，创建RDS实例|
|**createTransferTask**|POST|创建任务|
|**createVmInstance**|POST|根据云提供商创建虚拟机|
|**createVmKeypair**|POST|根据云提供商创建密钥对|
|**createVpc**|POST|根据云提供商创建私有网络|
|**createVpcEip**|POST|根据云提供商分配公网IP|
|**createVpcLBHttpListener**|POST|创建HTTP监听器|
|**createVpcNetworkInterface**|POST|根据云提供商创建网卡|
|**createVpcSecurityGroup**|POST|根据云提供商创建安全组|
|**createVpcSlb**|POST|根据云提供商创建负载均衡|
|**createVpcSubnet**|POST|根据云提供商创建子网|
|**createVpcVServerGroup**|POST|创建虚拟服务器组，并添加后端服务器|
|**deleteBucket**|DELETE|删除指定ID的OSS存储桶信息|
|**deleteChannel**|DELETE|删除channel|
|**deleteDatasource**|DELETE|删除数据源|
|**deleteDeployment**|DELETE|删除部署信息|
|**deleteRdsAccount**|DELETE|删除指定RDS实例上，指定用户名的账号信息|
|**deleteRdsByInstId**|DELETE|删除指定ID的RDS实例信息|
|**deleteRdsDatabase**|DELETE|删除指定RDS实例上，指定数据库名的数据库信息|
|**deleteTransferTask**|DELETE|根据指定ID删除任务|
|**deleteVmInstanceById**|DELETE|通过虚拟机id删除虚拟机|
|**deleteVmKeypairByName**|DELETE|删除密钥对|
|**deleteVpcById**|DELETE|删除VPC|
|**deleteVpcEipById**|DELETE|释放公网IP|
|**deleteVpcNetworkInterfaceById**|DELETE|删除弹性网卡|
|**deleteVpcSecurityGroupById**|DELETE|删除安全组|
|**deleteVpcSlbById**|DELETE|删除SLB|
|**deleteVpcSubnetById**|DELETE|删除子网|
|**detachDiskToVmInstanceByDiskId**|PUT|从虚拟机卸载云硬盘|
|**detachVpcNetworkInterfaceById**|PUT|卸载网卡|
|**disassociateVpcEipById**|PUT|解绑公网IP|
|**dryrunDeployment**|POST|预部署|
|**editDeployment**|PUT|修改部署信息|
|**editTransferTask**|PUT|根据指定ID修改任务|
|**getBucketByName**|GET|根据云提供商查询对应的OSS存储桶信息|
|**getBucketFiles**|GET|根据过滤条件，取得指定OSS存储桶上的文件列表|
|**getBuckets**|GET|根据云提供商查询对应的OSS存储桶列表|
|**getChannels**|GET|查询数据同步通道信息|
|**getCloudInfoById**|GET|获取指定云信息|
|**getCloudInfos**|GET|获取当前用户的云注册信息|
|**getDatasources**|GET|查询数据源|
|**getDeploymentResult**|GET|查询执行结果|
|**getDeploymentVersions**|GET|查询应用记录|
|**getDeployments**|GET|查询部署信息列表|
|**getDeploymentsById**|GET|查询部署信息|
|**getDeploymentsVersion**|GET|查询应用记录详细信息|
|**getDiskById**|GET|根据云提供商查询对应的云硬盘资源信息|
|**getDisks**|GET|根据云提供商查询对应的云硬盘资源信息|
|**getRdsAccountsByInstId**|GET|根据过滤条件，取得指定RDS实例上的账号信息|
|**getRdsAccountsByInstIdAndAccountName**|GET|根据过滤条件，取得指定RDS实例上的账号信息|
|**getRdsByInstId**|GET|根据云提供商查询对应的RDS实例信息|
|**getRdsDatabaseByInstIdAndDbName**|GET|根据过滤条件，取得指定RDS实例上的数据库信息|
|**getRdsDatabasesByInstId**|GET|根据过滤条件，取得指定RDS实例上的数据库信息|
|**getRdsInstances**|GET|根据云提供商查询对应的RDS实例信息|
|**getTaskInfoById**|GET|读取指定ID的运行结果和运行状态|
|**getTaskInfoHistoryById**|GET|读取指定ID的运行结果和运行状态|
|**getTransferTaskById**|GET|根据指定ID获取任务信息|
|**getTransferTaskFailedFiles**|GET|根据指定任务id查询迁移失败文件列表|
|**getTransferTaskProgress**|GET|根据指定任务id查询迁移进度|
|**getTransferTasks**|GET|获取任务列表|
|**getVmImages**|GET|根据过滤条件，取得镜像资源的信息|
|**getVmInstanceTypes**|GET|虚拟机规格列表|
|**getVmInstances**|GET|根据云提供商查询对应的虚拟机资源信息|
|**getVmInstancesById**|GET|根据云提供商查询对应的VM资源信息|
|**getVmKeypairs**|GET|根据云提供商查询对应的密钥对资源信息|
|**getVmKeypairsByName**|GET|根据云提供商查询对应的密钥对资源信息|
|**getVpcById**|GET|根据云提供商查询对应的VPC资源信息|
|**getVpcEipById**|GET|根据云提供商查询对应的公网IP资源信息|
|**getVpcEips**|GET|根据云提供商查询对应的公网IP资源信息|
|**getVpcNetworkInterfaceById**|GET|根据云提供商查询对应的网卡资源信息|
|**getVpcNetworkInterfaces**|GET|根据云提供商查询对应的网卡资源信息|
|**getVpcSecurityGroupById**|GET|根据云提供商查询对应的安全组资源信息|
|**getVpcSecurityGroups**|GET|根据云提供商查询对应的安全组资源信息|
|**getVpcSlbById**|GET|根据云提供商查询对应的SLB资源信息|
|**getVpcSlbs**|GET|根据云提供商查询对应的负载均衡资源信息|
|**getVpcSubnetById**|GET|根据云提供商查询对应的subnet资源信息|
|**getVpcSubnets**|GET|根据云提供商查询对应的subnet资源信息|
|**getVpcVServerGroups**|GET|根据过滤条件，取得服务器组的信息|
|**getVpcs**|GET|查询私有网络资源列表|
|**grantRdsAccount**|PUT|给RDS账号分配数据库权限|
|**rebootVmInstanceById**|PUT|只能重启状态为 运行中（Running）的实例。|
|**registCloudInfo**|POST|为指定用户关联云|
|**removeDiskById**|DELETE|删除云硬盘|
|**reverseDeployment**|POST|根据已有资源反向生成deployment|
|**revokeRdsAccount**|DELETE|给RDS账号分配数据库权限|
|**rollbackDeploymentsVersion**|PUT|应用部署回滚|
|**startChannel**|PUT|启动数据同步|
|**startTransferTask**|PUT|根据指定ID启动任务|
|**startVmInstanceById**|PUT|启动一台实例。实例状态必须为 已停止（Stopped），才可以调用该接口。|
|**stopChannel**|PUT|停止数据同步|
|**stopTransferTask**|PUT|根据指定ID停止任务|
|**stopVmInstanceById**|PUT|停止运行一台实例。只有状态为 运行中（Running）的实例才可以进行此操作。|
|**unregistCloudInfo**|DELETE|获取指定云信息|
