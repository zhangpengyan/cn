
## 蓝绿部署

### 概述

下面以将代码托管中的源代码，经过云编译，生成程序包，而后使用云部署蓝绿部署到云主机中为例，列举出基本服务，以帮助用户快速入门。

基本操作流程如下：

1）在云编译中，对示例源代码进行编译构建，生成程序包

2）使用云部署，将程序包部署到云主机中

3）使用负载均衡的公网IP:端口，可访问示例代码

示例前提：

- 已有云主机
- 已有负载均衡实例及监听器
- 示例代码已clone到代码托管中
- 已有对象存储空间


### 新建云主机

在地域：华北-北京，新建2台云主机，具体信息如下：

- 创建方式：自定义创建
- 镜像：官方 CentOS CentOS 7.4 64位
- 规格：通用型 1c4g
- 存储：默认选项
- 网络：选择已有的私有网络及子网、选择默认安全组开发全部端口
- 基本信息：填写主机名、密码。这里填写主机名为：codedeploy-demo03

接下来，安装Agent，登录云主机后，以root用户执行：

```
curl -fsSL http://deploy-code-vpc.jdcloud.com/dl-ifrit-agents/install_deploy | bash
```

执行结果如下：

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/starting20.png)


### 新建负载均衡实例及监听器

在地域：华北-北京，新建负载均衡实例，具体信息如下：

- 地域：华北-北京
- 可用区：可用区A
- 私有网络：请选择与云主机一致的私有网络
- 名称：codedeploy-lb-demo03

接下来，在此负载均衡实例中，新建监听器，点击“添加监听”，进入到新建监听器页面。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/practice11.png)


具体信息如下：

- 监听协议[端口]：Http 80
- 空闲链接超时：60
- 默认后端服务：新建后端服务
- 后端服务名称：codedeploy-backend-demo03
- 端口：9011
- 选择服务器组：暂不添加


### Clone示例代码至代码托管

代码示例地址为：https://code.jdcloud.com/devops-demo/java-demo.git

请将此示例代码clone至代码托管中，代码托管的地址为：https://code.jdcloud.com/


### 在云编译中进行编译构建

在云编译中新建任务，具体信息如下：

-  任务名称：codedeploy-ci-demo03
-  编译镜像：maven/maven3.6.0-jdk8
-  源提供商：京东云-代码托管
-  仓库地址：请根据实际情况进行填写，例如devops-demo/java-demo
-  代码分支：devops-demo
-  构建规范：插入构建命令
-  构建命令：
```
---
# 设置需要的环境变量，不需要可以不写
#envs:
#  - name: 'name1' 这里是环境变量的名称
#    value: 'value1' 这里是环境变量的值
#  - name: 'name2' 用列表的方式来了设置多个值
#    value: 'value2'

# 设置编译的命令, 同环境变量的设置方式
# 如:
#cmds: 
#  - name: 'do make'  步骤名称
#    cmd: 'make' 真实的命令,如果不在PATH中，需要写全路径
#  - name: 'do install'
#    cmd: 'make install'
cmds:
  - name: 'chmod'
    cmd: 'chmod a+x ./build.sh'
  - name: 'demo'
    cmd: './build.sh'

# 抽包路径, 这个是必选项
out_dir: 'output'
```
-  构建类型：应用包
-  存储空间：请选择已有的对象存储空间

至此，已将示例代码编译成功，并上传到对象存储空间中。

接下来，将开始使用云部署将程序包部署到云主机上。


### 新建应用及部署组

在“部署应用”页，指定与云主机、对象存储相同的地域后，点击“新建应用”，

使用分布式服务框架：请按照默认选择“否”

![Alt text](https://github.com/jdcloudcom/cn/blob/edit/image/CodeDeploy/Ch/Pra-1%EF%BC%88Ch%EF%BC%89.png)

跳转到“新建应用”页。

在“新建应用”页，首先填写应用信息。应用名称：codedeploy-app-demo03

![Alt text](https://github.com/jdcloudcom/cn/blob/edit/image/CodeDeploy/Ch/Pra-2%EF%BC%88Ch%EF%BC%89.png)

点击"新建"按钮。

接下来，在应用中新建部署组，

有以下选项：

- 部署组名称：请填写部署组名称，group1
- 部署类型：请选择“蓝绿部署”
- 部署目标：点击“选择”按钮，在弹窗中选择云主机。支持三种选择过滤条件：高可用组、标签、IP。这里请选择在上一步中创建的云主机，即主机名为：codedeploy-demo031加入蓝组，主机名为：codedeploy-demo032加绿组
- 使用负载均衡：是
- 负载均衡实例：请选择华北-北京地域中已有的负载均衡实例，codedeploy-lb-demo03
- 负载均衡后端服务：请选择上一项中指定的负载均衡实例下的后端服务，codedeploy-backend-demo03
- 高级选项：保持默认选项，详见操作指南

![Alt text](https://github.com/jdcloudcom/cn/blob/edit/image/CodeDeploy/Ch/Pra-3%EF%BC%88Ch%EF%BC%89.png)

填写部署组的基本信息后，请点击“新建”，将进行应用中部署组的新建。

创建成功后，将跳转到“应用详情”页。

![Alt text](https://github.com/jdcloudcom/cn/blob/edit/image/CodeDeploy/Ch/Pra-4%EF%BC%88Ch%EF%BC%89.png)

### 发起部署

在“应用详情”页，进入到“部署组”分页，可见上一步中创建完成的部署组。

![Alt text](https://github.com/jdcloudcom/cn/blob/edit/image/CodeDeploy/Ch/Pra-4%EF%BC%88Ch%EF%BC%89.png)

对于单个部署组，可支持的操作有：发起部署、部署历史、编辑、删除。

点击“发起部署”按钮，进入到“新建部署任务”页，

![Alt text](https://github.com/jdcloudcom/cn/blob/edit/image/CodeDeploy/Ch/Pra-5%EF%BC%88Ch%EF%BC%89.png)

有以下选项：

- 部署描述：非必须，为本次部署的描述信息
- 部署来源：支持多种部署来源，请选择云编译
- 云编译任务名称：请填写codedeploy-ci-demo03
- 云编译构建序号：请填写上一步中编译成功的构建序号
- 文件类型：请选择.tar.gz
- 部署操作命令：请选择“输入部署操作命令”，使用“表单填写”功能，填写具体操作命令，如下：
```
部署路径: 源目录或文件：/       目标目录：/home
停止脚本：/home/bin/stop.sh     
启动脚本：/home/bin/start.sh
检查脚本：
脚本执行账户：  root       
脚本超时时间（s）：100
```

注意：初次部署无需填写停止脚本。

![Alt text](https://github.com/jdcloudcom/cn/blob/edit/image/CodeDeploy/Ch/Pra-6%EF%BC%88Ch%EF%BC%89.png)

填写部署任务信息后，请点击“发起部署”，将触发部署操作。

将跳转到“部署详情”页。

### 查看部署详情

在“部署详情”页，可见本次部署的进展情况。在部署过程中，支持“取消”。

![Alt text](https://github.com/jdcloudcom/cn/blob/edit/image/CodeDeploy/Ch/Pra-7%EF%BC%88Ch%EF%BC%89.png)

点击“查看配置”，查看本次部署任务的详细配置信息。

点击指定实例的“查看日志”，查看部署日志。


### 验证结果

负载均衡公网IP:80

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/practice16.png)
