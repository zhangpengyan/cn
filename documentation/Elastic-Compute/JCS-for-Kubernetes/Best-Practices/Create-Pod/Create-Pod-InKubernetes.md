# 使用Virtual-Kubelet 在Kubernetes集群中创建原生容器Pod
在Kubernetes集群中完成Virtual-Kubetlet部署后，即可使用Kubectl客户端工具创建原生容器Pod。  

## Virtual Kubelet创建的原生容器Pod使用限制   
- 原生容器Pod暂不支持关联到Kubernetes的service服务；  
- 原生容器Pod不支持动态PVC挂载；挂载已有云硬盘或静态PV时，对应的云硬盘要带有文件系统；  
- 原生容器Pod名称设置规范：不能超过253字符，可以包含多个label，label以“.”分隔。label支持数字、小写字母、英文中划线“ - ”，不支持以“-”作为名称的开始字符和结束字符，且不能超过63字符；  
- 不支持设置DNSPolicy；  
- 原生容器Pod最多挂载7块云硬盘作为volume；  
- 原生容器Pod最多定义8个Container，Container数量受已添加的volume数量限制；  
- 使用Kubctl exec 在container中执行命令不支持-t参数；  
- 原生容器Pod默认为已定义的Container创建系统盘，系统盘设置参数如下：  
```
annotations:
    jdcloud.com/NativeContainer.SystemDisk.Name: distTest
    jdcloud.com/NativeContainer.SystemDisk.Type: ssd
    jdcloud.com/NativeContainer.container-test1.SystemDisk.SizeGB: "40"
    jdcloud.com/NativeContainer.container-test1.SystemDisk.FSType: ext4
    jdcloud.com/NativeContainer.SystemDisk.AutoDelete: "false"
```  

## 使用步骤（以CentOS 7.4 64位操作系统为例）  

1. 登录安装了kubectl并能连接到kubernetes集群服务端点的服务器。kubectl客户端的安装和设置，参考[安装和设置kubectl](https://docs.jdcloud.com/cn/jcs-for-kubernetes/connect-to-cluster)；  

2. 下载[jdcloud-virtual-kubelet.tar.gz](http://kubernetes.oss.cn-north-1.jcloudcs.com/virtual-kubelet/jdcloud-virtual-kubelet.tar.gz)，解压文件并进入解压目录，执行virtual-kubelet.sh脚本。详情参考[Virtual-Kubelet部署](https://docs.jdcloud.com/cn/native-container/deploy-virtual-kubelet)；  

3. virtual-kubelet部署完成后执行以下命令确定virtual-kubelet运行正常。  
`  
kubectl get nodes		#确定virtual-kubelet虚节点运行正常  
`  
```
NAME                         STATUS    ROLES     AGE       VERSION
k8s-node-*******-90lirk7snb   Ready     <none>    10d       v1.8.12-249.9d2635d
k8s-node-*******-90lirk7snb   Ready     <none>    10d       v1.8.12-249.9d2635d
k8s-node-*******-90lirk7snb   Ready     <none>    10d       v1.8.12-249.9d2635d
virtual-kubelet-cn-****-2a   Ready     agent     3d        v1.8.3
virtual-kubelet-cn-****-2b   Ready     agent     3d        v1.8.3
```  
`  
kubectl get pods -n kube-system -o wide		#确定virtual-kubelet插件运行正常
`  
```
NAME                                          READY     STATUS             RESTARTS   AGE       IP           NODE
virtual-kubelet-cn-****-2a-7b****f7f-plmnp    1/1       Running            0          6h        10.0.128.5   k8s-node-v****4-90****snb
virtual-kubelet-cn-****-2b-78****c4b7-mk8nv   1/1       Running            0          6h        10.0.128.3   k8s-node-v****a-90****snb
```   
4.  使用virtual-kubelet 创建原生容器pod的Yaml示例如下：  
pod_example.yaml内容如下：  
```
apiVersion: v1
kind: Pod
metadata:
  name: pod-example
  annotations:
    jdcloud.com/NativeContainer.SystemDisk.Name: distTest
    jdcloud.com/NativeContainer.SystemDisk.Type: ssd
    jdcloud.com/NativeContainer.container-test1.SystemDisk.SizeGB: "40"
    jdcloud.com/NativeContainer.container-test1.SystemDisk.FSType: ext4
    jdcloud.com/NativeContainer.SystemDisk.AutoDelete: "false"
spec:
  containers:
  - name: container-test1
    image: busybox:latest
    command: ["/bin/sh", "-c", "while true; do date && echo Welcome to JDCLOUD! && sleep 5;done"]
    imagePullPolicy: Never
    resources:
      requests:
        memory: "64Mi"
        cpu: "1"
  - name: container-test2
    image: busybox:latest
    command: ["/bin/sh", "-c", "while true; do date && echo Welcome to JDCLOUD! && sleep 5;done"]
    imagePullPolicy: Never
    resources:
      requests:
        memory: "64Mi"
        cpu: "1"
      limits:
        memory: "100Mi"
        cpu: "2"
  nodeSelector:
    kubernetes.io/hostname: virtual-kubelet-cn-****-1a		#必填项，且必须与部署virtual-kubelet时选择的可用区一致
  tolerations:
  - key: virtual-kubelet.io/provider
    operator: Exists
```    
`    
kubectl create -f pod_example.yaml  
`    

- **通过Virtual-Kubelet创建原生容器pod注意事项：**    

  - 在pod的yaml文件中，必须增加nodeSelector 和 tolerations   
  - 在nodeSelector中，kubernetes. io/hostname: hostname为必填项  

```
nodeSelector:
    kubernetes.io/role: agent
    beta.kubernetes.io/os: linux
    type: virtual-kubelet
    kubernetes.io/hostname: virtual-kubelet-{AZ}		#必填项，且必须与部署virtual-kubelet时选择的可用区一致
tolerations:
- key: virtual-kubelet.io/provider
  operator: Exists

```    

