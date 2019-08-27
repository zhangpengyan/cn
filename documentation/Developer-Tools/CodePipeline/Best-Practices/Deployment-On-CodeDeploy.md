
## 构建并部署到云部署

本文档以构建一个java项目并部署到京东云-云部署为例说明如何使用流水线。

基本操作流程如下：

1）在京东云-代码托管中创建源代码

2）在京东云-云编译中，对示例源代码进行编译构建，生成应用包

3）在京东云-云部署中，创建部署应用及部署组

请确保云编译任务、云部署应用和流水线在同一个区域。


### Clone示例代码至代码托管

代码示例地址为：https://code.jdcloud.com/JDCloud-Codebuild/hello-java

请将此示例代码clone至代码托管中，代码托管的地址为：https://code.jdcloud.com/


### 在云编译中创建编译任务

在云编译中新建任务，具体信息如下：

-  应用名称：ci-demo
-  编译镜像：maven/maven3.6.0-jdk13
-  代码源：京东云-代码托管
-  代码库：选择示例代码，JDCloud-Codebuild/hello-java
-  分支：master
-  构建命令：使用源代码根目录下的jdcloud-build.yml
-  构建类型：应用包
-  存储空间：请选择已有的对象存储空间
-  文件夹名：选填，可以为空
-  高级设置：保持默认选项即可

保存，完成云编译任务的准备。

### 在云部署中创建应用及部署组

使用云部署前，请先确保已经有云主机且安装成功部署[Agent](../../../Developer-Tools/CodeDeploy/Operation-Guide/Install-Agent.md)


为了成功访问部署应用，建议给云主机[绑定公网IP](../../../Elastic-Compute/Virtual-Machines/Operation-Guide/Network/Associate-Elastic-IP.md)。


在“新建应用”页，首先填写应用信息。

应用名称：cd-demo

   ![](/image/codepipeline/cre-deploy.PNG)

点击"新建"按钮。

接下来，在应用中新建部署组，

有以下选项：

- 部署组名称：请填写部署组名称，cd-demo-group
- 部署类型：请选择“滚动部署”
- 部署目标：点击“选择”按钮，在弹窗中选择云主机。支持三种选择过滤条件：高可用组、标签、IP。这里请选择在上一步中创建的云主机。
- 使用负载均衡：否
- 高级选项：保持默认选项，详见操作指南


    ![](/image/codepipeline/cd-demo-group.PNG)
     

填写部署组的基本信息后，请点击“新建”，完成部署应用的准备。

### 新建流水线

详细操作步骤如下：

1. 点击 创建 选择 快速创建。配置流水线名称，如pipeline-demo

     ![](/image/codepipeline/pipeline-demo.PNG)

2. 配置源代码

  阶段名默认为 源代码，添加源代码操作。操作中选择京东云-代码托管，选择示例代码JDCloud-Codebuild/hello-java。
  
   ![](/image/codepipeline/source-best2.PNG)


3. 配置构建。

  阶段名默认为 构建阶段，添加构建操作。   
  
   ![](/image/codepipeline/build-best2.PNG)

-  操作名称：构建操作
-  操作类型：构建
-  操作提供方：云编译
-  代码源：构建任务的源代码，选择上一步中创建的源代码操作。
-  任务：选择云编译中创建的编译任务，如ci-demo
-  手工确认：如选择手工确认，该操作会在用户点击确认后继续执行。
     
   
 
4. 配置部署。
 
 阶段名默认为 部署阶段，添加部署操作。 
 
 
   ![](/image/codepipeline/deploy-best2.PNG)
        
      
   ![](/image/codepipeline/deploy-best2.1.PNG)
       
      
-  操作名称：部署操作
-  操作类型：部署
-  操作提供方：云部署
-  部署来源：部署任务。目前仅支持构建类型为应用包的云编译任务。
-  部署应用：选择云部署中创建的部署任务，如cd-demo
-  部署组：选择云部署中创建的部署组
-  部署命令：提供部署命令，选择 输入部署操作命令，在yaml中贴如下命令：

 ```
files:
  - source: /
    destination: /home/demo
hooks:
  ApplicationStart:
    - command: /home/demo/bin/start.sh
      timeout: 10
      runas: root
permisssions: []
env: {}
 ```

-  手工确认：如选择手工确认，该操作会在用户点击确认后继续执行。
 
 
保存并发布。 

发布成功，以公网IP：8080访问发布的应用，效果如下：

 ![](/image/codepipeline/success.PNG)

