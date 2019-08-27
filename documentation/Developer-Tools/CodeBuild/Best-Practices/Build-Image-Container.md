# 构建镜像并存储至镜像仓库

本文档以构建一个 Golang软件项目生成镜像为例说明如何使用 云编译。


基本操作流程如下：

1）在京东云-代码托管中创建源代码

2）在京东云-容器镜像仓库中创建注册表和镜像仓库

3）在京东云-云编译中，对示例源代码进行编译构建，生成镜像并完成推送

请确保云编译任务、容器镜像仓库在同一个区域。

### Clone示例代码至代码托管

代码示例地址为：https://code.jdcloud.com/devops-demo/golang-demo

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

云编译任务列表页面，点击 新建任务。

具体信息如下：

   ![](/image/codebuild/best-ct.PNG)
   
-  应用名称：golang-demo
-  编译镜像：golang/golang 1.12
-  代码源：京东云-代码托管
-  代码库：选择示例代码，devops-demo/golang-demo
-  分支：master
-  构建命令：选择插入构建命令
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
-  构建类型：镜像
-  镜像仓库：选择已经创建的镜像仓库
-  高级设置：保持默认选项即可


保存并执行，编译构建任务。

 
### 查看构建日志

在任务详情页面可以查看最新的构建日志，也可以下构建历史中查看历次的构建历史。

   ![](/image/codebuild/best-log.PNG)

### 登录镜像仓库查看推送镜像

云编译执行成功之后，将产出镜像推送至用户指定的容器镜像仓库。

用户可在 容器镜像仓库-- 镜像列表，选择云编译中选择的镜像仓库，查看构建产出镜像。

   ![](/image/codebuild/best-image.PNG)


