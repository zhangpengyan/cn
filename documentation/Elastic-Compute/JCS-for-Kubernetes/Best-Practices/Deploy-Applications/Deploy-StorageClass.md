
# 部署StorageClass

StorageClass为Kubernetes集群提供了描述存储类别（class）的方法，包含provisioner、parameters 和 reclaimPolicy等字段，当 class 需要动态分配持久化存储时会使用到。  
京东云为Kubernetes集群提供了自定义卷插件[kubernetes.io/jdcloud-ebs](https://kubernetes.io/docs/concepts/storage/storage-classes/)， 将provisioner定义为京东云自定义卷插件，可以使用京东云云硬盘为Kubernetes集群提供持久化存储。目前，在Kubernetes集群服务中，提供三种storageclass:

```
kubectl get storageclass

NAME                PROVISIONER                 AGE
default (default)   kubernetes.io/jdcloud-ebs   39d
jdcloud-hdd         kubernetes.io/jdcloud-ebs   39d
jdcloud-ssd         kubernetes.io/jdcloud-ebs   39d

```
您也可以创建自定义的Storageclass：
```
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: mystorageclass-hdd1
provisioner: kubernetes.io/jdcloud-ebs
parameters:
  zones: cn-north-1a, cn-north-1b
  fstype: ext4
reclaimPolicy: Retain
```
**参数说明：**  
1、provisioner：设置参数值[kubernetes.io/jdcloud-ebs](https://kubernetes.io/docs/concepts/storage/storage-classes/)，且不可修改，标识使用京东云云硬盘Provisioner插件创建。

2、reclaimPolicy：由 storage class 动态创建的 Persistent Volume 会在的 reclaimPolicy 字段中指定回收策略，可以是 Delete 或者 Retain。如果 storageClass 对象被创建时没有指定 reclaimPolicy ，它将默认为 Delete。

3、parameters  
  - type：设置参数值为ssd或premium-hdd，分别对应京东云的SSD云盘和高效云盘；
  - fstype：设置文件系统类型，可选参数值为xfs和ext4，如未指定fstype，将使用ext4作为默认的文件系统类型；例如：fstype=ext4；
  - zones：根据集群所在的地域设置云硬盘所在的可用区；在支持单可用区的地域，您可以不设置该参数；在支持多可用区的地域，您可以选择某一可用区或选择全部可用区（参数值之间使用","分隔），例如：zones=cn-north-1a, cn-north-1b，选择全部可用区时，新建的云硬盘将根据名称hash算法，被随机分配到某一可用区； 地域与可用区的对应关系参考下表：  

|地域 | 可用区   |
| ------ | ------ | 
|华北-北京	|可用区A	cn-north-1a  |
|华北-北京	|可用区B	cn-north-1b  |
|华北-北京	|可用区C	cn-north-1c  |
|华东-宿迁	|可用区A	cn-east-1a   |
|华东-上海  |可用区A	cn-east-2a   |
|华东-上海	|可用区B	cn-east-2b   |
|华南-广州	|可用区A	cn-south-1a  |

4、您可在创建持久化存储声明（ Persistent Volume Claim）时，通过storageClassName字段关联某一指定的storageclass资源，根据storageClass定义动态创建并绑定一个持久化存储（Persistent Volume）或直接绑定具有相同storageClassName且参数符合要求的持久化存储（Persistent Volume）；更多详情参考[部署持久化存储](https://docs.jdcloud.com/cn/jcs-for-kubernetes/deploy-pv)  ；

5、更多storageClass参数说明，参考[Kubernetes 参数说明文档](https://kubernetes.io/docs/concepts/storage/storage-classes/)。 


 
