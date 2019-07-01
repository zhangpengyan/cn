# Configmap概述
ConfigMap 用于保存配置数据的键值对，可以用来保存单个属性，也可以用来保存配置文件。ConfigMap 跟 secret 很类似，但它可以更方便地处理不包含敏感信息的字符串。

**创建Configmap**    
1. 打出控制台，进入[弹性计算>>Kubernetes集群>>ConfigMap](https://cns-console.jdcloud.com/host/kubernetesconfigmap/list)  
2. 选择Kubernetes集群，（Kubernetes集群创建完后，需要等工作节点组创建完再进行操作）  
![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/JCS-for-Kubernetes/Deployment选择集群.png)  
3. 点击‘创建’按钮，进入创建页面  
![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/JCS-for-Kubernetes/创建Deployment.png)    
4. 支持‘从yaml文件导入’或者在线编辑yaml文件，并支持全屏展示  
5. 编辑完毕，点击‘确认’按钮，进入入[弹性计算>>Kubernetes集群>>ConfigMap](https://cns-console.jdcloud.com/host/kubernetesconfigmap/list)查看    
6. 点击名称，进入详情页，可以查看资源信息、Yaml文件、事件  

**更新Configmap**    
1. 打出控制台，进入入[弹性计算>>Kubernetes集群>>ConfigMap](https://cns-console.jdcloud.com/host/kubernetesconfigmap/list)  
2. 点击‘更新’按钮，进入编辑页面  
![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/JCS-for-Kubernetes/更新ConfigMap.png)  
3. 编辑完成后，点击‘确认’即可   

**删除Configmap**    
1. 打出控制台，进入[弹性计算>>Kubernetes集群>>ConfigMap](https://cns-console.jdcloud.com/host/kubernetesconfigmap/list)      
2. 点击‘删除’按钮，进入删除确认弹窗  
3. 点击‘确认’即可  
