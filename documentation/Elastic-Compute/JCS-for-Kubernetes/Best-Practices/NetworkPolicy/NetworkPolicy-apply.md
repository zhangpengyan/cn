
# 定义Network Policy

集群中开启Network Policy后，您可以在集群中定义Network Policy资源，为集群中不同类型的应用定义精确的网络隔离策略，实现集群内部应用之间或集群应用与外部网络端点之间的网络控制。

**操作说明**

 1. 京东云Network Policy说明参考[Network Policy部署说明]()；
 2. 定义Network Policy资源之前，您首先需要[开启Network Policy]()；
 3. 您需要使用Kubectl客户端[连接到集群](https://docs.jdcloud.com/cn/jcs-for-kubernetes/connect-to-cluster)。

**操作步骤：**

**一、创建一组测试Pod，验证没有定义Network Policy的情况下，Pod之间的网络连通**

 1. 创建一个名称为policy-test的namespace用于测试：

 `
kubectl create namespace policy-test
 `

 2. 在测试命名空间中创建一个使用nginx镜像,label为run=nginx的deployment：

 ```
kubectl run deployment-nginx --image=nginx --replicas=2 -n policy-test

等待一段时间直到全部Pod处于running状态：
kubectl get pod --show-labels -n policy-test -o wide
NAME                                READY   STATUS    RESTARTS   AGE   IP           NODE                         NOMINATED NODE   LABELS
deployment-nginx-7777ff954d-b8w29   1/1     Running   0          91s   10.0.0.46    k8s-node-vmgvar-jo700huqmx   <none>           pod-template-hash=7777ff954d,run=deployment-nginx
deployment-nginx-7777ff954d-m6xm7   1/1     Running   0          91s   10.0.0.218   k8s-node-vm8opj-t9tmdz7rop   <none>           pod-template-hash=7777ff954d,run=deployment-nginx
 ```

 3. 新建一个Pod测试上述nginx Pod的网络连通性：
```
kubectl run nginx-test --rm -it --image=busybox --restart=Never -- /bin/sh 

在nginx-test的命令行终端里，输入如下命令测试nginx Pod的连通性

wget -O- 10.0.0.46

查看返回的内容，确认nginx能够被访问
```

**二、部署一个拒绝全部网络访问的Network Policy，重新验证Pod之间的网络连通**

1. 为policy-test namespace中的pod定义Network policy,拒绝所有的网络访问

```
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/NetworkPolicy/denyall.yml

Yaml文件内容如下：

kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: default-deny
  namespace: policy-test
spec:
  podSelector:
    matchLabels: {}
```
2.使用上述Yaml文件创建Network Policy：

`
kubectl create -f denyall.yml

`
3. 重新创建一个Pod测试上述nginx Pod的网络连通性

```
kubectl run nginx-test --rm -it --image=busybox --restart=Never -- /bin/sh 

在nginx-test的命令行终端里，输入如下命令测试nginx Pod的连通性

wget -O- 10.0.0.46

查看返回的内容，确认访问被拒绝
```

**三、部署一个允许部分Pod访问指定Pod的Network Policy，重新验证Pod之间的网络连通**

1. 为policy-test namespace中的pod定义Network policy,拒绝所有的网络访问

```
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/NetworkPolicy/allow-nginx.yml

Yaml文件内容如下：

kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: allow-nginx
  namespace: policy-test
spec:
  podSelector:
    matchLabels:
      run: deployment-nginx
  ingress:
    - from:
      - podSelector:
          matchLabels:
            run: nginx-test
```
2.使用上述Yaml文件创建Network Policy：

`
kubectl create -f allow-nginx.yml

`
3. 重新创建一个Pod测试上述nginx Pod的网络连通性

```
kubectl run nginx-test --rm -it --image=busybox --restart=Never -- /bin/sh 

查看nginx-test Pod的label：
kubectl get pod nginx-test --show-labels
NAME         READY   STATUS    RESTARTS   AGE   LABELS
nginx-test   1/1     Running   0          89m   run=nginx-test


在nginx-test的命令行终端里，输入如下命令测试nginx Pod的连通性

wget -O- 10.0.0.46

查看返回的内容，确认nginx能够被访问
```
4. 新建另外一个不具有label run=nginx-testde Pod，重新测试nginx Pod的连通性

```
kubectl run nginx-test-withoutlabel --rm -it --image=busybox --restart=Never -- /bin/sh 

查看nginx-test-withoutlabel Pod的label：
kubectl get pod nginx-test-withoutlabel --show-labels
NAME                      READY   STATUS    RESTARTS   AGE    LABELS
nginx-test-withoutlabel   1/1     Running   0          2m8s   run=nginx-test-withoutlabel


在nginx-test-withoutlabel的命令行终端里，输入如下命令测试nginx Pod的连通性

wget -O- 10.0.0.46

查看返回的内容，确认访问被拒绝
```