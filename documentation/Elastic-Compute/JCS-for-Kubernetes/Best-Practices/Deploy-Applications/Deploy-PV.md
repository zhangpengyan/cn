
# 部署持久化存储

京东云Kubernetes集群服务集成了京东云云硬盘，您可以在集群中使用京东云云硬盘作为持久化存储；  

## 一、使用京东云云硬盘定义静态存储
    
**1. 创建PV**
```
kind: PersistentVolume
apiVersion: v1
metadata:
  name: pv-static
  labels:
    type: jdcloud-ebs
spec:
  capacity:
    storage: 30Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  jdcloudElasticBlockStore:
    volumeID: vol-ogcbkdjg7x      #云硬盘ID请使用与kubernetes集群同地域的且状态为可用的云硬盘ID替换
    fsType: xfs
```     
**参数说明：**

1、如您需要在京东云Kubernetes集群服务中使用京东云云硬盘作为持久化存储，请在PersistentVolume定义时，指定插件jdcloudElasticBlockStore；  

2、volumeID：指定同地域下为Kubernetes集群服务提供持久化存储的云硬盘ID；  

3、fsType：指定文件系统类型；目前仅支持ext4和xfs两种；  

4、capacity：PV 将具有特定的存储容量。这是使用 PV 的容量属性设置的。更多详情参考[云硬盘帮助文档](https://docs.jdcloud.com/cn/cloud-disk-service/features)；

|StorageClass type | 云硬盘类型   |容量范围  |步长|
| ------ | ------ | ------ |------ |
|	ssd|SSD云盘  | [20-1000]GiB  |10GiB |
|premium-hdd	|高效云盘 | [20-3000]GiB  |10GiB|
|hdd.std1	|容量型hdd | [20-16000]GiB  |10GiB|
|ssd.gp1	|通用型ssd | [20-16000]GiB  |10GiB|
|ssd.io1	|性能型ssd | [20-16000]GiB  |10GiB|

5、PersistentVolume 可以以资源提供者支持的任何方式挂载到主机上。  
  - 京东云云硬盘目前只支持一种模式ReadWriteOnce——该卷可以被单个节点以读/写模式挂载；  
  - 访问模式包括：  
    - ReadWriteOnce——该卷可以被单个节点以读/写模式挂载。在命令行中，访问模式缩写为：RWO - ReadWriteOnce

6、京东云为PersistentVolume提供了插件，插件类型为：jdcloudElasticBlockStore  

注：  
- 由于云硬盘限制一个云硬盘只能同时挂载一个云主机,在使用基于pvc的pod时，建议使用replicas=1来创建一个部署集。StatefulSet可解决多副本问题。  
- pod迁移,pvc迁移(卸载旧实例/挂载新实例)默认35秒。  
- 通过deployment部署，删除deployment之后，可重新挂载原有pvc到新的pod里面。  

**2. 创建PVC**  

1、持久化存储声明（PVC）可以指定一个标签选择器来进一步过滤该组卷。只有标签与选择器匹配的卷可以绑定到声明。选择器由两个字段组成：

  - 所有来自 matchLabels 和 matchExpressions 的要求都被“与”在一起——它们必须全部满足才能匹配。本例使用matchlabels作为过滤条件，将匹配的PersistentVolume绑定到PersistentVolumeClaim。

    - matchLabels：volume 必须有具有该值的标签

    - matchExpressions：这是一个要求列表，通过指定关键字，值列表以及与关键字和值相关的运算符组成。有效的运算符包括 In、NotIn、Exists 和 DoesNotExist。  

2、访问模式包括：ReadWriteOnce——该卷可以被单个节点以读/写模式挂载。在命令行中，访问模式缩写为：RWO - ReadWriteOnce  

3、京东云为PersistentVolume提供了插件，插件类型为：jdcloudElasticBlockStore  
  

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pv-static-pvc
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: ""
  resources:
    requests:
      storage: 30Gi
  selector:
    matchLabels:
      type: jdcloud-ebs
```
**3. 创建Pod**
```
kind: Pod
apiVersion: v1
metadata:
  name: pod-static
spec:
  volumes:
    - name: pv-static
      persistentVolumeClaim:
        claimName: pv-static-pvc
  containers:
    - name: busybox-static
      image: busybox
      command:
         - sleep
         - "600"
      imagePullPolicy: Always
      volumeMounts:
        - mountPath: "/usr/share/mybusybox/"
          name: pv-static
```

**4. 您也可以直接创建使用静态存储的pod**
```
kind: Pod
apiVersion: v1
metadata:
  name: pod-static
spec:
  volumes:
    - name: pv-static
      jdcloudElasticBlockStore:
        volumeID: vol-ogcbkdjg7x      #云硬盘ID请使用与kubernetes集群同地域的且状态为可用的云硬盘ID替换
        fsType: xfs
  containers:
    - name: busybox-static
      image: busybox
      command:
         - sleep
         - "600"
      imagePullPolicy: Always
      volumeMounts:
        - mountPath: "/usr/share/mybusybox/"
          name: pv-static
```


## 二、使用京东云云硬盘定义动态存储

当集群中的静态 PV 都不匹配新建的 PersistentVolumeClaim 时，集群可能会尝试动态地为 PVC 创建卷。

1、京东云云硬盘规格说明参考下表；更多详情参考[云硬盘帮助文档](https://docs.jdcloud.com/cn/cloud-disk-service/features)；

|StorageClass type | 云硬盘类型   |容量范围  |步长|
| ------ | ------ | ------ |------ |
|	ssd|SSD云盘  | [20-1000]GiB  |10GiB |
|premium-hdd	|高效云盘 | [20-3000]GiB  |10GiB|
|hdd.std1	|容量型hdd | [20-16000]GiB  |10GiB|
|ssd.gp1	|通用型ssd | [20-16000]GiB  |10GiB|
|ssd.io1	|性能型ssd | [20-16000]GiB  |10GiB| 

2、创建PVC
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc1
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: jdcloud-ssd
  resources:
    requests:
      storage: 20Gi
```  
3、查看集群的PVC  

`kubectl get pvc`  

输出:  
```
NAME                                         STATUS    VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
pvc1                                         Bound     pvc-73d8538b-ebd6-11e8-a857-fa163eeab14b   20Gi       RWO            jdcloud-ssd    18s
```  
4、查看集群的PV  

`kubectl get pv`  

输出：  
```
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS    CLAIM                                                STORAGECLASS   REASON    AGE
pvc-73d8538b-ebd6-11e8-a857-fa163eeab14b   20Gi       RWO            Delete           Bound     default/pvc1                                         jdcloud-ssd              2m
```  
**注**：基于StorageClass jdcloud-ssd，为PVC创建了卷。一旦 PV 和 PVC 绑定后，PersistentVolumeClaim 绑定是排他性的，不管它们是如何绑定的。 PVC 跟 PV 绑定是一对一的映射。

 
