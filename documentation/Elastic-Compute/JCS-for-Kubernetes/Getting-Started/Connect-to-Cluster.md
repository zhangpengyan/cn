
# 连接集群

 **安装kubectl客户端**

Kubernetes 命令行客户端 kubectl可以让您从客户端计算机连接到 Kubernetes 集群，实现应用部署。

## 1.kubectl版本 

kubectl版本可以集群版本一致，或者集群版本+1。集群版本为1.12.3时，推荐下载的Kubectl版本为1.12.3；

## 2.安装和设置 kubectl 客户端

打开[Kubernetes 版本页面](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.12.md) ，找到client binaries（也就是kubectl），选择对应操作系统的客户端，然后复制链接地址。示例，选择kubectl版本1.12.3，Centos 7.4 64位系统下,链接地址为https://dl.k8s.io/v1.12.3/kubernetes-client-linux-amd64.tar.gz;

京东云提供了1.12.3版本的kubectl客户端，您可以直接下载使用，详情参考如下命令：

```
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/kubectl/1.12.3/kubernetes-client-linux-amd64.tar.gz
tar -zxvf kubernetes-client-linux-amd64.tar.gz
cd kubernetes/client/bin
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```
具体其他系统安装，还请参考[官方文档](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## 3.配置集群凭据

凭据在Kubernetes集群-集群服务-集群-详情页-kubectl客户端配置，将凭据复制到本机$HOME/.kube/config；配置完成后，您即可以使用 kubectl 从本地计算机访问 Kubernetes 集群。
例：Centos 7.4 64位系统下，执行以下命令：
```
mkdir -p ~/.kube
touch ~/.kube/config
vi ~/.kube/config
```
保存凭据完成，执行以下命令验证：  
`kubectl version`  
出现以下内容，即为配置成功：  
```
Client Version: version.Info{Major:"1", Minor:"12", GitVersion:"v1.12.3", GitCommit:"5d26aba6949f188fde1af4875661e038f538f2c6", GitTreeState:"clean", BuildDate:"2018-04-23T23:17:12Z", GoVersion:"go1.12.3", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"12+", GitVersion:"v1.12.3-23.56f6f14",GitCommit:"9d2635d891e745a24d6863cd61b0767575a5e79c", GitTreeState:"", BuildDate:"2018-07-23T10:39:25Z", GoVersion:"go1.12.3", Compiler:"gc", Platform:"linux/amd64"}
```
