# Deployment概述
Deployment 为 Pod 和 ReplicaSet 提供了一个声明式定义方法，用来替代以前的ReplicationController来方便的管理应用。  
典型的应用场景包括：  
- 定义Deployment来创建Pod和ReplicaSet  
- 滚动升级和回滚应用  
- 扩容和缩容  
- 暂停和继续Deployment  

**创建Deployment**  
1. 打出控制台，进入[弹性计算>>Kubernetes集群>>Workloads>>Deployment](https://cns-console.jdcloud.com/host/kubernetesdeployment/list)  
2. 选择Kubernetes集群，（Kubernetes集群创建完后，需要等工作节点组创建完再进行操作）  
![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/JCS-for-Kubernetes/Deployment选择集群.png)  
3. 点击‘创建’按钮，进入创建页面  
![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/JCS-for-Kubernetes/创建Deployment.png)    
4. 支持‘从yaml文件导入’或者在线编辑yaml文件，并支持全屏展示  
5. 编辑完毕，点击‘确认’按钮，进入[弹性计算>>Kubernetes集群>>Workloads>>Deployment](https://cns-console.jdcloud.com/host/kubernetesdeployment/list)查看  
6. 点击名称，进入详情页，可以查看基本信息、Pod模板、Condition、Yaml文件、事件  

**更新Deployment**   
1. 打出控制台，进入[弹性计算>>Kubernetes集群>>Workloads>>Deployment](https://cns-console.jdcloud.com/host/kubernetesdeployment/list)  
2. 点击‘更新’按钮，进入编辑页面  
![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/JCS-for-Kubernetes/更新Deployment.png)  
3. 编辑完成后，点击‘确认’即可  

**删除Deplomment**    
1. 打出控制台，进入[弹性计算>>Kubernetes集群>>Workloads>>Deployment](https://cns-console.jdcloud.com/host/kubernetesdeployment/list)  
2. 点击‘删除’按钮，进入删除确认弹窗  
3. 点击‘确认’即可  
