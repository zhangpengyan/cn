# Pod概述  
Pod是Kubernetes创建或部署的最小/最简单的基本单位，一个Pod代表集群上正在运行的一个进程。    
一个Pod封装一个应用容器（也可以有多个容器），存储资源、一个独立的网络IP以及管理控制容器运行方式的策略选项。 

**创建Pod**  
1. 打出控制台，进入[弹性计算>>Kubernetes集群>>Workloads>>Pod](https://cns-console.jdcloud.com/host/kubernetespod/list)  
2. 选择Kubernetes集群，（Kubernetes集群创建完后，需要等工作节点组创建完再进行操作）  
![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/JCS-for-Kubernetes/Deployment选择集群.png)  
3. 点击‘创建’按钮，进入创建页面  
![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/JCS-for-Kubernetes/创建Deployment.png)    
4. 支持‘从yaml文件导入’或者在线编辑yaml文件，并支持全屏展示  
5. 编辑完毕，点击‘确认’按钮，进入入[弹性计算>>Kubernetes集群>>Workloads>>Pod](https://cns-console.jdcloud.com/host/kubernetespod/list)  查看  
6. 点击名称，进入详情页，可以查看资源信息、Container、存储、Condition、Yaml文件、事件  

**更新Pod**  
1. 打出控制台，进入入[弹性计算>>Kubernetes集群>>Workloads>>Pod](https://cns-console.jdcloud.com/host/kubernetespod/list)  
2. 点击‘更新’按钮，进入编辑页面  
![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/JCS-for-Kubernetes/更新Pod.png)  
3. 编辑完成后，点击‘确认’即可  

**删除Pod**  
1. 打出控制台，进入入[弹性计算>>Kubernetes集群>>Workloads>>Pod](https://cns-console.jdcloud.com/host/kubernetespod/list)    
2. 点击‘删除’按钮，进入删除确认弹窗  
3. 点击‘确认’即可  
