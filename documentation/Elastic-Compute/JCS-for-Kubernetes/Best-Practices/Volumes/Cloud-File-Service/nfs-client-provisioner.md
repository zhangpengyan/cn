# 部署nfs-client-provisioner                  

Kubernetes集群中NFS类型的存储没有内置 Provisioner。但是您可以在集群中为NFS配置外部Provisioner。

Nfs-client-provisioner是一个开源的NFS 外部Provisioner，利用NFS Server为Kubernetes集群提供持久化存储，并且支持动态创建PV。但是nfs-client-provisioner本身不提供NFS，需要现有的NFS服务器提供存储。

本文将以京东云云文件服务（CFS）作为NFS服务器，提供nfs-client-provisioner部署过程说明。

## 一、部署说明

* nfs-client-provisioner在集群中以deployment的方式运行, 副本数为1；

* nfs-client-provisioner自身作为外部Provisioner在集群中运行；

* 使用nfs-client-provisioner定义Storage Class时， Storage Class中的provisioner必须与nfs-client-provisioner 中定义的PROVISIONER_NAME相同；

* 用户使用nfs-client-provisioner服务关联的StorageClass创建PVC时, nfs-client-provisioner在cfs文件系统中创建子目录, 初始化并创建PV；

* nfs-client-provisioner在NFS服务器上提供PV的命名格式：${namespace}-${pvcName}-${pvName}；

* PV被删除后, nfs-client-provisioner会对pv子目录进行归档或者删除操作；
  
* nfs-client-provisioner在NFS服务器上归档PV的命名格式：archieved-${namespace}-${pvcName}-${pvName} ；

* 每个nfs-client-provisioner deployment对应一个CFS 文件存储，如需在集群中关联多个CFS文件存储，请参考示例部署多个nfs-client-provisioner deployment。

## 二、连接到集群

 Kubernetes 命令行客户端 kubectl可以让您从客户端计算机连接到 Kubernetes 集群，实现应用部署。详情参考使用Kubectl客户端[连接到Kubernetes集群](https://docs.jdcloud.com/cn/jcs-for-kubernetes/connect-to-cluster)。

## 三、部署nfs-client-provisioner

nfs-client-provisioner在集群中以deployment的方式运行，并且nfs-client-provisioner需要访问kube-api获取PVC对象的变化，如果您的集群启用了RBAC，则必须授权provisioner。详细部署说明参考下文。

**说明**： 您需要在集群的Node节点上安装nfs驱动。驱动安装过程参考[挂载文件存储](https://docs.jdcloud.com/cn/cloud-file-service/mount-file-system)

```
#在Node节点的终端下，运行如下命令:

sudo yum install –y nfs-utils
```

1. 创建Service Account，Yam文件下载及说明如下：

* 下载Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/nfs-client-provisioner/ServiceAccount.yml
`

* Yaml文件说明：

```
kind: ServiceAccount
apiVersion: v1
metadata:
  name: nfs-client-provisioner
```

* 使用Yaml文件创建Service Account：

`
kubectl create -f ServiceAccount.yml
`

* 使用命令行创建Service Account

`
kubectl create serviceaccount nfs-client-provisioner        #创建名称为nfs-client-provisioner的Service Account
`

2. 创建Cluster Role，Yaml文件下载及说明如下：

* 下载Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/nfs-client-provisioner/ClusterRole.yml
`

* Yaml文件说明：

```
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: nfs-client-provisioner-runner
rules:
  - apiGroups: [""]
    resources: ["persistentvolumes"]
    verbs: ["get", "list", "watch", "create", "delete"]
  - apiGroups: [""]
    resources: ["persistentvolumeclaims"]
    verbs: ["get", "list", "watch", "update"]
  - apiGroups: ["storage.k8s.io"]
    resources: ["storageclasses"]
    verbs: ["get", "list", "watch"]
  - apiGroups: [""]
    resources: ["events"]
    verbs: ["create", "update", "patch"]
```

* 使用Yaml文件创建Cluster Role：

`
kubectl create -f ClusterRole.yml
`

3. 创建Cluster Role Binding，Yaml文件下载及说明如下：

* 下载Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/nfs-client-provisioner/ClusterRoleBinding.yml
`

* Yaml文件说明：

```
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: run-nfs-client-provisioner
subjects:
  - kind: ServiceAccount
    name: nfs-client-provisioner
    namespace: default
roleRef:
  kind: ClusterRole
  name: nfs-client-provisioner-runner
  apiGroup: rbac.authorization.k8s.io
```

* 使用Yaml文件创建Cluster Role：

`
kubectl create -f ClusterRoleBinding.yml
`

4. 创建Role，Yaml文件下载及说明如下：

* 下载Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/nfs-client-provisioner/Role.yml
`

* Yaml文件说明：

```
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: leader-locking-nfs-client-provisioner
rules:
  - apiGroups: [""]
    resources: ["endpoints"]
    verbs: ["get", "list", "watch", "create", "update", "patch"]
```

* 使用Yaml文件创建Cluster Role：

`
kubectl create -f Role.yml
`

5. 创建Role Binding，Yaml文件下载及说明如下：

* 下载Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/nfs-client-provisioner/RoleBinding.yml
`

* Yaml文件说明：

```
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: leader-locking-nfs-client-provisioner
subjects:
  - kind: ServiceAccount
    name: nfs-client-provisioner
    # replace with namespace where provisioner is deployed
roleRef:
  kind: Role
  name: leader-locking-nfs-client-provisioner
  apiGroup: rbac.authorization.k8s.io
```

* 使用Yaml文件创建Cluster Role：

`
kubectl create -f RoleBinding.yml
`

6. 创建 nfs-client-provisioner Deployment，Yaml文件下载及说明如下：

* 下载Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/nfs-client-provisioner/Deploy.yml
`

* Yaml文件说明：

```
kind: Deployment
apiVersion: extensions/v1beta1
metadata:
  name: nfs-client-provisioner
spec:
  replicas: 1
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: nfs-client-provisioner
    spec:
      serviceAccountName: nfs-client-provisioner
      containers:
        - name: nfs-client-provisioner
          image: quay.io/external_storage/nfs-client-provisioner:latest
          imagePullPolicy: IfNotPresent
          volumeMounts:
            - name: nfs-client-root
              mountPath: /persistentvolumes
          env:
            - name: PROVISIONER_NAME
              value: jdcloud-cfs			#PROVISIONER_NAME的Value值与StorageClass的Provisioner字段值必须保持一致
            - name: NFS_SERVER
              value: 172.**.**.10			#请使用文件存储的挂载目标IP地址替换
            - name: NFS_PATH
              value: /cfs			#请使用挂载目标支持的目录替换，默认挂载到/cfs目录
      volumes:
        - name: nfs-client-root
          nfs:
            server: 172.**.**.10			#请使用文件存储的挂载目标IP地址替换
            path: /cfs			#请使用挂载目标支持的目录替换，默认挂载到/cfs目录
```

* 使用Yaml文件创建Deployment：

`
kubectl create -f Deploy.yml
`

四、验证nfs-client-provisioner运行状态

在集群中查看nfs-client-provisioner Deployment的运行状态，所有Pod处于running状态并且运行的副本数与期望副本数一致时，则表示nfs-client-provisioner运行成功。

```
kubectl get deployment
NAME                     DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nfs-client-provisioner   1         1         1            1           42m
```
