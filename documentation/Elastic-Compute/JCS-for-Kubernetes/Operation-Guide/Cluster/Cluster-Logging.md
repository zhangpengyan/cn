# 集群日志

## 概述
- 京东云为Kubernetes集群提供了系统日志，用户日志和容器实时日志三种类型日志，其中系统日志和用户日志与日志服务进行了集成，方便用户多维度查询，检索与分析，为日常运维和管理提供了有效的支持。

## 系统日志
京东云Kubernetes集群作为托管集群，Master节点上的服务例如kube-apiserver,kube-controller-manager都是已托管形式运行的。用户在实际管理自己的kubernetes业务时，都是通过Kubernetes API server来执行的。为此我们提供了系统日志功能来帮助用户更好地了解Kubernetes集群运行状态。

### 查看日志
系统日志不需要用户在Kubernetes集群做任何操作，默认所有新建Kubernetes集群会将系统日志发送到日志服务后端。用户可以随时在日志服务中查看。具体操作步骤如下
1. 进入日志集管理页面，选择已创建的日志集，点击“查看”按钮，进入日志详情页面，选择采集配置“未配置”状态日志主题，点击“采集配置”按钮，进入采集配置页面。
2. 点击“添加采集配置”按钮，进入添加采集配置页面
3. 选择所属产品 (Kubernetes集群)、日志类型 (系统日志)，采集实例“全部实例”或 “选择实例”，点击“保存”即完成采集配置的设置。
- 全部实例：用户该产品**所有区域的全部实例**都进行采集，包括后续新增的实例都将自动采集。
- 选择实例：选择部分实例，可将你关注的实例进行采集，最多可添加20台实例。
关于日志服务的操作细节可以访问[日志服务帮助文档](../../../../Management/Log-Service/Getting-Started/LogService-Started.md)

### 日志模块

| 模块名称                  | 描述                  | 
| :-------------------:| :-------------------: | 
| kube-apiserver                 | Kubernetes API server                 | 
| kube-proxy-master                 |  Master节点上的网络代理服务                | 
| kube-scheduler                 | Kubernetes调度器                   | 
| kube-controller-manager                   | 管理控制器                  | 
| scheduler-extender                  |  调度器扩展                 | 
| etcd                  | 提供Kubernetes元数据存储                   | 
| dockerd                 | docker daemon                   | 
| kubelet                 | 管理节点上的容器的服务                   | 


### 日志Metadata含义
| 字段名                  | 含义                  | 
| :-------------------:| :-------------------: | 
| cluster_id             | 集群id                  |
| region_id                  | 地域id                  |
| source                  | 日志文件名称                  |
| stream                  | 输出设备                  |
| severity                  | 日志级别                  |
| time                 | 日志时间戳                  |
| file                 | 采集日志的模块名称                  |
| originalMsg                  | 日志原文                  |
| appName                  | 应用标识                  |
| container_image                  | 容器镜像                  |
| container_name                  | 容器名称                  |
| host                  | 主机名                  |
| namespace_name                  | 命名空间名称                  |
| pod_id                  | pod id                  |
| pod_name                  | pod名称                  |



## 用户日志
用户日志会采集Kubernetes集群所有运行在工作节点组上容器内标准输出的日志并转发到日志服务，帮助用户进行分析，检索。

### 打开用户日志

1.登录控制台，在左侧菜单选择【弹性计算】-【Kubernetes集群】-【集群名称】，点击进入Kubernetes集群详情页；  
2.在详情页选择集群监控开关，点击关闭或开启Kubernetes集群监控；  

### 关闭用户日志

### 查看用户日志

### 最佳实践

### 限制

### 日志Metadata含义

## 容器实时日志

### 查看容器实时日志
