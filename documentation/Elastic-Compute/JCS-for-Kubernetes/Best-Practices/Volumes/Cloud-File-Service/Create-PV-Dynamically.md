# 使用nfs-client-provisioner动态创建PV               

Nfs-client-provisioner是一个开源的NFS 外部Provisioner，利用NFS Server为Kubernetes集群提供持久化存储。[部署nfs-client-provisioner](https://docs.jdcloud.com/cn/jcs-for-kubernetes/nfs-client-provisioner)后，您可以在Kubernetes集群中动态创建PV。

## 一、连接到集群

 Kubernetes 命令行客户端 kubectl可以让您从客户端计算机连接到 Kubernetes 集群，实现应用部署。详情参考使用Kubectl客户端[连接到Kubernetes集群](https://docs.jdcloud.com/cn/jcs-for-kubernetes/connect-to-cluster)。

## 二、部署nfs-client-provisioner

详情参考在集群中[部署nfs-client-provisioner](https://docs.jdcloud.com/cn/jcs-for-kubernetes/nfs-client-provisioner)。

## 三、动态创建PV

StorageClass为PVC提供动态发现、绑定PV的配置。因此创建一个使用nfs-client-provisioner的Storage Class，并在创建PVC时显式指定对应的StorageClassName，就可以基于CFS云文件存储在Kubernetes集群中动态创建NFS类型的PV。

1. 创建Storage Class，Yam文件下载及说明如下：

* 下载Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/storageClass-With-jdcloud-cfs.yml
`

* Yaml文件说明：

```
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: auto-cfs-storage
provisioner: jdcloud-cfs        #nfs-client-provisioner deployment env中定义的PROVISIONER_NAME保持一致
parameters:
  archiveOnDelete: "false"          #archiveOnDelete定义为false时，删除NFS Server中对应的目录，为true则保留；
```

* 使用Yaml文件创建Storage Class：

`
kubectl create -f storageClass-With-jdcloud-cfs.yml
`

* 查看Storage Class状态

```
kubectl get storageClass auto-cfs-storage
NAME               PROVISIONER   AGE
auto-cfs-storage   jdcloud-cfs   5m15s
```

2. 创建PVC，Yaml文件下载及说明如下：

* 下载Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/Create-PV-dynamically.yml
`

* Yaml文件说明：

```
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: auto-pv-with-nfs-client-provisioner
spec:
  storageClassName: auto-cfs-storage        #使用nfs-client-provisioner作为NFS外部provisioner的Storage Class Name；
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Mi      #NFS Server中对应的挂载目录大小；目前CFS文件存储不限制挂载目录的容量；storage不超过文件存储最大容量限制即可
```

* 使用Yaml文件创建PVC：

`
kubectl create -f Create-PV-dynamically.yml
`

* 查看PVC状态

```
kubectl get pvc auto-pv-with-nfs-client-provisioner
NAME                                  STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS       AGE
auto-pv-with-nfs-client-provisioner   Bound    pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7   1Mi        RWX            auto-cfs-storage   10s


kubectl describe pvc auto-pv-with-nfs-client-provisioner
Name:          auto-pv-with-nfs-client-provisioner
Namespace:     default
StorageClass:  auto-cfs-storage
Status:        Bound
Volume:        pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7         #根据Storage Class配置动态创建的PV名称
Labels:        <none>
Annotations:   pv.kubernetes.io/bind-completed: yes
               pv.kubernetes.io/bound-by-controller: yes
               volume.beta.kubernetes.io/storage-provisioner: jdcloud-cfs
Finalizers:    [kubernetes.io/pvc-protection]
Capacity:      1Mi
Access Modes:  RWX
Events:
```

4. 验证根据Storage Class配置动态创建的PV状态：

* 上一步操作中Volume字段值即为动态创建的PV名称，PV被自动绑定到对应的PVC，查看PV状态及详情：

```
kubectl get pv pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                                         STORAGECLASS       REASON   AGE
pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7   1Mi        RWX            Delete           Bound    default/auto-pv-with-nfs-client-provisioner   auto-cfs-storage            15m


kubectl describe pv pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7
Name:            pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7
Labels:          <none>
Annotations:     pv.kubernetes.io/provisioned-by: jdcloud-cfs
Finalizers:      [kubernetes.io/pv-protection]
StorageClass:    auto-cfs-storage
Status:          Bound
Claim:           default/auto-pv-with-nfs-client-provisioner
Reclaim Policy:  Delete
Access Modes:    RWX
Capacity:        1Mi
Node Affinity:   <none>
Message:         
Source:
    Type:      NFS (an NFS mount that lasts the lifetime of a pod)
    Server:    10.XX.XX.11      #CFS文件存储中对应的挂载目标IP地址
    Path:      /cfs/default-auto-pv-with-nfs-client-provisioner-pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7      # NFS Server中由nfs-client-provisioner自动创建的子目录
    ReadOnly:  false
Events:        <none>
```

5. 在Kubernetes集群Nat子网中新建一台云主机，并将CFS文件存储挂载到云主机，验证CFS 文件存储中新增的目录，验证步骤说明如下：

* 登录到云主机，详情参考[登录Linux实例](https://docs.jdcloud.com/cn/virtual-machines/connect-to-linux-instance);
* 安装utils客户端，在CentOS 的终端下，运行如下命令：

`
sudo yum install –y nfs-utils
`

* 在云主机上将CFS文件存储挂载到cfs目录下，运行如下命令：

```
mkdir /cfs      #在云主机上创建一个新目录
mount -t nfs 172.XX.XX.10:/cfs /cfs     #将nfs 172.XX.XX.10:/cfs挂载到云主机的cfs目录上，其中172.XX.XX.10请使用云文件存储的挂载目标IP替换
```

* 挂载成功后，在云主机的cfs目录下查看云文件存储中与PV关联的目录，运行如下命令：

```
cd /cfs       #进入云主机上的cfs目录

ls -a       # 查看cfs目录中的内容
default-auto-pv-with-nfs-client-provisioner-pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7        #ls输出内容，验证cfs目录下新增了子目录，子目录名称与PV Source.Path一致的目录

```

* 更多详情参考云文件服务[挂载文件存储](https://docs.jdcloud.com/cn/cloud-file-service/mount-file-system)。

## 四、创建Pod，使用第三步中创建的PVC

1. 新建一个Pod，挂载第三步中创建的PVC作为volume，并在指定目录下新增一个文件，YAML文件下载及说明如下：

* 下载Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/pod-touch-cfs.yml
`

* Yaml文件说明：

```
kind: Pod
apiVersion: v1
metadata:
  name: pod-touch-cfs
spec:
  containers:
  - name: test-pod
    image: busybox
    imagePullPolicy: IfNotPresent
    command:
      - "/bin/sh"
    args:
      - "-c"
      - "touch /mnt/SUCCESS && exit 0 || exit 1"            #在/mnt目录下新建一个名称为SUCCESS的文件，并写入helloworld
    volumeMounts:
      - name: nfs-pvc
        mountPath: "/mnt"           #将volume挂载到Pod的/mnt目录
  restartPolicy: "Never"
  volumes:
    - name: nfs-pvc
      persistentVolumeClaim:
        claimName: auto-pv-with-nfs-client-provisioner          #指定与云文件存储建立绑定关系的PVC 名称
```

* 使用Yaml文件创建Pod：

`
kubectl create -f pod-touch-cfs.yml
`

* 查看Pod状态

```
kubectl get pod pod-touch-cfs
NAME            READY   STATUS    RESTARTS   AGE
pod-touch-cfs   1/1     Running   0          11s

执行exec进入pod，验证文件内容
kubectl exec -it pod-touch-cfs /bin/sh
/ # cat /mnt/SUCCESS
helloworld
```

2. 重新登录第三步中Nat子网中的云主机，查看云主机/cfs目录下，与PV建立绑定关系的云文件存储目录下新增的文件内容，运行如下命令：

```
cd /cfs       #进入云主机上的cfs目录

ls -a       # 查看cfs目录中的内容
default-auto-pv-with-nfs-client-provisioner-pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7        #ls输出内容，验证cfs目录下新增了子目录，子目录名称与PV Source.Path一致的目录

cat default-auto-pv-with-nfs-client-provisioner-pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7/SUCCESS
helloworld        #与PV Source.Path一致的子目录下，查看新增文件SUCCESS的内容
```

3. 删除pod pod-touch-cfs

```
kubectl delete pod pod-touch-cfs
pod "pod-touch-cfs" deleted
```

4. 重新创建一个Pod，并在Pod中挂载上述PVC，Pod  YAML下载及说明如下：

* 下载YAML文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/CFS/verify-pv-cfs.yml
`

* YAML文件说明如下：

```
kind: Pod
apiVersion: v1
metadata:
  name: verify-pv-cfs
spec:
  containers:
  - name: c1
    image: busybox
    imagePullPolicy: IfNotPresent
    command:
    - /bin/sh
    args:
    - -c
    - 'while true; do ls -l /mnt/cfs/; sleep 2; done'		
    volumeMounts:
    - mountPath: "/mnt/cfs"
      name: cfs-pv001
  volumes:
  - name: cfs-pv001
    persistentVolumeClaim:
      claimName: auto-pv-with-nfs-client-provisioner          #与云文件存储建立绑定关系的PVC 名称
```

* 使用Yaml文件创建Pod

```
kubectl create -f verify-pv-cfs.yml
pod/verify-pv-cfs created
```

* 查看Pod运行状态

```
kubectl get pod verify-pv-cfs
NAME            READY   STATUS    RESTARTS   AGE
verify-pv-cfs   1/1     Running   0          15s

查看Pod verify-pv-cfs输出的日志：
kubectl logs verify-pv-cfs
total 1
-rw-r--r--    1 root     root            18 Aug  7 07:29 SUCCESS

exec进入Pod verify-pv-cfs，查看SUCCESS文件的内容：
kubectl exec -it verify-pv-cfs /bin/sh
/ # cat /mnt/cfs/SUCCESS
helloworld
```

5. 删除pod verify-pv-cfs

```
kubectl delete pod verify-pv-cfs
pod "verify-pv-cfs" deleted
```

## 五、删除PVC，验证CFS 云文件存储对应目录的回收策略

1. 删除PVC auto-pv-with-nfs-client-provisioner，运行如下命令：

```
kubectl delete pvc auto-pv-with-nfs-client-provisioner
persistentvolumeclaim "auto-pv-with-nfs-client-provisioner" deleted

```

2. 确认与PVC关联的PV pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7的运行状态：

```
kubectl get pv pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7
Error from server (NotFound): persistentvolumes "pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7" not found

输出以上结果，说明与PVC关联的PV pvc-c44da35f-b8bc-11e9-b6cc-fa163e229fe7已被自动删除
```


3. 重新登录第三步中Nat子网中的云主机，查看云主机/cfs目录下，与PV建立绑定关系的云文件存储目录下新增的文件内容，运行如下命令：

```
cd /cfs       #进入云主机上的cfs目录

ls -a       # 查看cfs目录中的内容
输出内容说明：输出内容为空，则表明PVC、PV被删除后，CFS文件存储中由nfs-client-provisioner自动创建的子目录及文件内容已被成功回收
```
