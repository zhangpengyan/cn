# 通过静态PV的方式使用京东云文件服务

PV是Kubernetes集群中的资源，是Volume类的卷插件，用于描述持久化存储数据卷，具有独立于使用PV的Pod的生命周期。[京东云文件服务](https://docs.jdcloud.com/cn/cloud-file-service/product-overview)支持NFS协议，因此可以在Kubernetes集群中使用nfs类型的PV定义。

PV支持两种配置方式：

* 静态：由集群管理员创建，具有capacity、accessMode、类型等实际存储细节，可直接被使用；

* 动态：当静态创建的PV都不匹配用户定义的PersistentVolumeClaim 时，集群会尝试动态地为 PVC 创建Volume。Volume的配置基于 StorageClasses定义；PVC将根据storageClassName字段发现PV。

本文将提供在Kubernetes集群中以静态配置PV的方式使用京东云文件服务的操作步骤和应用示例。

**专有名词**：

* PV：Persistent Volume，描述持久化存储数据卷；

* PVC：Persistent Volume Claim，描述持久化存储卷请求声明；

* SC: Storage Class, 提供描述存储“class（类）”的方法，为PVC提供动态创建/绑定PV的存储配置；与PVC具有相同StorageClassName的PV才可以被绑定到PVC；
  
## 一、创建CFS文件存储

1. 您需要首先创建一个[CFS文件存储](https://docs.jdcloud.com/cn/cloud-file-service/creating-file-system)，建议您在Kubernetes集群的Node子网中创建文件存储；

2. 文件存储支持通过挂载目标的IP地址挂载文件存储，您可以在文件存储详情页查询挂载目标的IP地址，详情参考[文件存储信息](https://docs.jdcloud.com/cn/cloud-file-service/file-system-detail)。

## 二、连接到集群

 Kubernetes 命令行客户端 kubectl可以让您从客户端计算机连接到 Kubernetes 集群，实现应用部署。详情参考使用Kubectl客户端[连接到Kubernetes集群](https://docs.jdcloud.com/cn/jcs-for-kubernetes/connect-to-cluster)。

## 三、在集群中使用CFS文件存储定义NFS类型的PV

**说明**： 您需要在集群的Node节点上安装nfs驱动。驱动安装过程参考[挂载文件存储](https://docs.jdcloud.com/cn/cloud-file-service/mount-file-system)

```
#在Node节点的终端下，运行如下命令:

sudo yum install –y nfs-utils
```

    
1. 创建一个StorageClass，StorageClass文件说明如下：

```
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: manual-cfs-storage
provisioner: kubernetes.io/no-provisioner       # nfs没有内部的provisioner
```

**参数说明**：

* 您可以执行如下命令下载示例Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/storageClass-for-PV.yml
`

* StorageClass为PVC提供动态发现、绑定NFS类型PV的配置。

2. 使用如下命令创建StorageClass并查看StorageClass状态：

```
kubectl create -f storageClass-for-PV.yml       #storageClass-for-PV.yml可使用本地目录保存的文件名称替换
storageclass.storage.k8s.io/manual-cfs-storage created

kubectl get sc manual-cfs-storage
NAME                 PROVISIONER                    AGE
manual-cfs-storage   kubernetes.io/no-provisioner   33m

```

3. 新建一个NFS类型的PV，并关联上一步中创建的Storage Classs 配置，PV YAML文件说明如下：

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: cfs-pv001
  labels:
    pv: cfs-pv001
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Recycle
  storageClassName: manual-cfs-storage          #使用第一步中创建的Storage Class；可以使用其他自定义Storage Class Name替换；
  nfs:
    path: /cfs          #请使用挂载目标支持的目录替换，默认挂载到/cfs目录
    server: 172.**.**.10        #请使用文件存储的挂载目标IP地址替换

```   

**参数说明**：

* 您可以执行如下命令下载示例Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/CFS-As-PV.yml
`

* 创建PV前，请根据CFS文件存储信息修改Yaml文件中对应参数值。

4. 使用如下命令创建PV并查看PV状态：

```
kubectl create -f CFS-As-PV.yml       # pv-with-cfs.yml可使用本地目录保存的文件名称替换
persistentvolume/cfs-pv001 created

kubectl get pv
NAME        CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS         REASON   AGE
cfs-pv001   1Gi        RWO            Recycle          Available           manual-cfs-storage            14m
```

5. 定义一个PVC，将上一步创建的PV绑定到该PVC，PVC YAML文件说明如下：

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: cfs-pvc001
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: manual-cfs-storage          #请与PV Yaml文件中使用的StorageClassClass保持一致

```

**参数说明**：

* 您可以执行如下命令下载示例Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/PVC-Bound-With-PV.yml
`

* 创建PVC前，请保证PVC、PV使用的StorageClassName一致。

6. 创建PVC，并验证PVC与PV的绑定状态：

```
kubectl create -f PVC-Band-With-PV.yml
persistentvolumeclaim/cfs-pvc001 created


kubectl get pvc
NAME         STATUS   VOLUME      CAPACITY   ACCESS MODES   STORAGECLASS         AGE
cfs-pvc001   Bound    cfs-pv001   1Gi        RWO            manual-cfs-storage   14s

```

7. 创建一个Pod，将Bound状态的PVC挂载到Pod。Pod Yaml文件说明如下：

```
kind: Pod
apiVersion: v1
metadata:
  name: cfs-pod001
spec:
  containers:
  - name: c1
    image: busybox
    imagePullPolicy: IfNotPresent
    command:
    - /bin/sh
    args:
    - -c
    - "echo 'Hello CFS' > /mnt/cfs/hello.txt; sleep 3000"
    volumeMounts:
    - mountPath: "/mnt/cfs"
      name: cfs-pv001
  volumes:
  - name: cfs-pv001
    persistentVolumeClaim:
      claimName: cfs-pvc001

```  

**参数说明**：

* 上述YAML文件将PVC挂载到Pod的/mnt/cfs目录；
* 您可以执行如下命令下载示例Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/Pod-With-PVC-Mounted.yml
`

* 创建Pod前，请根据PVC的定义修改Yaml文件中对应参数值。

8. 创建Pod，并验证Pod处于运行状态时，执行如下命令进入Pod，查看/mnt/cfs-read目录下的文件内容

```
kubectl create -f Pod-With-PVC-Mounted.yml
pod/cfs-pod001 created

kubectl get pod cfs-pod001
NAME         READY   STATUS    RESTARTS   AGE
cfs-pod001   1/1     Running   0          13s

kubectl exec -it cfs-pod001 /bin/sh
/ # cat /mnt/cfs/hello.txt
Hello CFS

```

9. 执行如下命令删除Pod

```
kubectl delete pod cfs-pod001
pod "cfs-pod001" deleted
```

10. 重新创建一个Pod，并在Pod中挂载上述PVC，Pod  YAML文件说明如下：

```
kind: Pod
apiVersion: v1
metadata:
  name: cfs-pod002
spec:
  containers:
  - name: c1
    image: busybox
    imagePullPolicy: IfNotPresent
    command:
    - /bin/sh
    args:
    - -c
    - 'while true; do ls -l /mnt/cfs-read/; sleep 2; done'
    volumeMounts:
    - mountPath: "/mnt/cfs-read"
      name: cfs-pv001
  volumes:
  - name: cfs-pv001
    persistentVolumeClaim:
      claimName: cfs-pvc001

```   

**参数说明**：

* 上述YAML文件将PVC挂载到Pod的/mnt/cfs-read目录
* 您可以执行如下命令下载示例Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/read-data-from-pvc.yml
`

* 创建Pod前，请根据PVC的定义修改Yaml文件中对应参数值。

11. 创建Pod，并验证Pod处于运行状态时，执行如下命令进入Pod，查看/mnt/cfs目录下的文件内容

```
kubectl create -f read-data-from-pvc.yml
pod/cfs-pod002 created

kubectl get pods cfs-pod002
NAME                READY   STATUS    RESTARTS   AGE
cfs-pod002          1/1     Running   0          77s


kubectl exec -it cfs-pod002 /bin/sh
/ # cat /mnt/cfs-read/hello.txt
Hello CFS

```

12. 通过第11步的验证即可发现，名称为cfs-pod001的Pod在CFS中写入的文件hello.txt被持久化保存到CFS文件存储，并且可以被名称为cfs-pod002的Pod共享。

13. 执行如下命令删除Pod

```
kubectl delete pod cfs-pod002
pod "cfs-pod002" deleted
```