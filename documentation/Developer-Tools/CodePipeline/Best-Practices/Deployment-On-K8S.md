# 构建并部署到Kubernetes集群
本文档以构建一个 Golang软件项目并部署到京东云Kubernetes集群为例说明如何使用 流水线。

基本操作流程如下：

1）在京东云-代码托管中创建源代码

2）在京东云-容器镜像仓库中创建注册表和镜像仓库

3）在京东云-云编译中，对示例源代码进行编译构建，生成镜像存储至容器镜像仓库

4）在京东云-Kubernetes集群中，创建集群

请确保云编译任务、Kubernetes集群和流水线在同一个区域。


### Clone示例代码至代码托管

代码示例地址为：https://code.jdcloud.com/JDCloud-Codebuild/golang-demo

请将此示例代码clone至代码托管中，代码托管的地址为：https://code.jdcloud.com/


### 在容器镜像仓库中创建镜像仓库

**一、创建注册表**

 1. 打开控制台，选择[弹性计算-容器镜像仓库-注册表](https://cns-console.jdcloud.com/host/containerregistry/list)，选择创建按钮  
    ![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/Container-Registry/创建注册表页面.png)  
 2. 选择地域，支持华北-北京、华东-上海、华南-广州  
 3. 填写名称，名称全局唯一且不支持修改；长度大于3个字符，且不能超过32字符；以小写字母数字开始和结尾，支持使用小写字母、数字、中划线(-)  
 4. 描述非必填项，描述不能超过256个字符，不支持修改  
 5. 注册表URI自动生成，规则为：注册表名称-地域缩写.jcr.service.jdcloud.com  
 6. 点击确定  

**二、创建镜像仓库**

 1. 打开[弹性计算-容器镜像仓库-镜像仓库](https://cns-console.jdcloud.com/host/containerrepository/list)，选择创建按钮  
 ![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/Container-Registry/新建镜像仓库.png)  
 2. 选择地域，支持华北-北京、华东-上海、华南-广州  
 3. 选择所属注册表  
 4. 填写名称，名称大于3个字符且不超过255个字符，同一注册表下名称唯一且不可修改；支持使用多级命名空间，命名空间以/分隔，各级命名空间不可为空，以小写字母数字开始和结尾，支持使用小写字母、数字、中划线(-)，下划线（ _ ）  
 5. 描述非必填项，描述不能超过256个字符，不支持修改  
 6. 镜像仓库URI自动生成，注册表URI/镜像仓库名称  
 7. 点击确定  




### 在云编译中创建编译任务

在云编译中新建任务，具体信息如下：

-  应用名称：Golang-Demo
-  编译镜像：golang/golang:1.12
-  代码源：京东云-代码托管
-  代码库：选择示例代码，devops-demo/golang-demo
-  分支：master
-  构建命令：插入构建命令，如下
 ```
 cmds:
  - name: Make output
    cmd: mkdir -p output;env
  - name: Unit Test
    cmd: go test ./... || exit 1
  - name: Build
    cmd: GOPATH=${WORKSPACE}/workspace; go install demo
  - name: Copy file
    cmd: cp -r bin output

# 抽包路径, 这个是必选项
out_dir: 'output'

 ```

-  构建类型：镜像仓库
-  镜像仓库：选择已创建的容器镜像仓库
-  高级设置：保持默认选项即可

保存，完成云编译任务的准备。


![](/image/codepipeline/best-ct.PNG)
	

### 在Kubernetes集群中创建集群

 1.打开控制台，选择[弹性计算>>Kubernetes集群>>集群服务>>集群](https://cns-console.jdcloud.com/host/kubernetes/list)   
 ![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/JCS-for-Kubernetes/新建Kubernetes集群集群信息.png)  
 
 2.选择创建地域，点击“创建”按钮，建议您根据业务情况选择集群所在地域及可用区；默认选中指定地域下的所有可用区，建议按照默认模式；也可取消选中某个可用区，需要保证至少有一个可用区被选中。  
 
 3.设置名称、描述：名称不可为空
 
 4.集群版本：目前支持1.12.3版本。
 
 5.管理节点CIDR：与其他私有网络的CIDR不可重叠，CIDR掩码取值范围为24 ~ 27。CIDR的设置规则参考私有网络CIDR的规则。 
 
 6.客户端证书、基础鉴权：默认全部开启，建议全部保留；需要至少保留一个为开启状态；客户端证书：基于base64编码的证书，用于客户端到集群服务端点的认证；基础鉴权：开启后允许客户端使用用户名、密码在集群服务端点认证。  
 
 7.添加Accesskey：选择启动状态下的Accesskey；如果无可用Access Key，请前往Access Key管理页面创建新的Access Key，并在开启状态。可参考Accesskey管理。  
 
新建工作节点组：  
 ![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/JCS-for-Kubernetes/新建Kubernetes集群工作节点组.png)   
 
8.私有网络：选择创建的私有网络。建议新建私有网络，掩码取值范围16~18。  

9.工作节点CIDR：设置规则参考私有网络下子网CIDR的规则，CIDR掩码取值范围为16~18。   

10.镜像：仅支持京东云定制镜像。 

11.规格：根据具体业务情况选择不同云主机规格类型，支持云主机第二代规格。可参考实例规格类型。  

12.数量：默认数量为3，可根据需求，可以点击增加、减少按键或者输入数量，最大数量为Node CIDR中可创建的主机数量、云主机配额中的最小值。

13.名称：默认名称为nodegroup1，名称不可为空，只支持中文、数字、大小写字母、英文下划线“_”及中划线“-”，且不能超过32字符。同一集群下的工作节点组不可重名。  

14.以下为高级选项，非必填项  
描述：描述不能超过256个字符  
系统盘：本地盘，容量默认为100G，不可修改。  
标签：设置添加到工作节点上的标签；键由前缀和名称组成；前缀不超过253字符，名称和值不超过63字符；前缀由DNS子域名组成，键值必须以字母数字起始，支持“-”“ _ ”“.”、大写字母，小写字母和数字；最多可添加5组标签。

15.完成相关设置后，点击确定，即可进入弹性计算>>Kubernetes集群>>集群服务>>集群，查看创建的Kubernetes集群，创建过程一般需要几分钟，还请耐心等待。



**生成长期有效的临时令牌**

参见[自动定期获取临时令牌，长期有效](../../../Elastic-Compute/Container-Registry/Best-Practices/Deploy-Application.md)。



### 新建流水线

详细操作步骤如下：

1. 点击 创建 选择 快速创建。配置流水线名称，如pipeline-k8s-demo

     ![](/image/codepipeline/pipeline-k8s-demo.PNG)

2. 配置源代码

  阶段名默认为 源代码，添加源代码操作。操作中选择京东云-代码托管，选择示例代码devops-demo/golang-demo。
  
   ![](/image/codepipeline/best-k8s-source.PNG)


3. 配置构建。

  阶段名默认为 构建阶段，添加构建操作。   
  
   ![](/image/codepipeline/best-k8s-build3.PNG)


-  操作类型：构建
-  操作名称：使用默认的名称即可
-  操作提供方：云编译
-  代码源：构建任务的源代码，选择上一步中创建的源代码操作。
-  任务：选择云编译中创建的编译任务，如Golang-Demo
-  手工确认：如选择手工确认，该操作会在用户点击确认后继续执行。
     
   
 
4. 配置部署。
 
 阶段名默认为 部署阶段，添加部署操作。 
 
   ![](/image/codepipeline/best-k8s-deploy.PNG)
     
-  操作类型：部署
-  操作名称：使用默认的名称即可
-  操作提供方：Kubernetes集群
-  目标集群：选择已经创建的k8s集群
-  创建部署方式：选择页面填写应用详情
    -  应用名：如golang-deployment
    -  镜像来源：选择云编译，部署编译产出的镜像到k8s集群
    -  容器组数量(replicas)：填写副本数
    -  镜像拉取保密字典(imagePullSecrets):部署云编译的产出镜像，需要配置imagePullSecrets字段。    
-  手工确认：如选择手工确认，该操作会在用户点击确认后继续执行。

 
4.为了成功访问部署应用，在Kubernetes集群-Service页面，给这个deployment添加一个负载均衡服务。  

创建yaml如下：

	```
	kind: Service
	apiVersion: v1
	metadata:
	  name: lb-demo
	  namespace: default
	  labels:
	    k8s-app: kubernetes-test
	spec:
	  ports:
	    - protocol: TCP
	      port: 80
	      targetPort: 8088
	      nodePort: 30190
	  selector:
	    app: golang-deployment
	  type: LoadBalancer
	  sessionAffinity: None
	  externalTrafficPolicy: Cluster 
	```
 
 
保存并发布。 

发布成功，以公网IP访问发布的应用，效果如下：

![](/image/codepipeline/best-success.PNG)


