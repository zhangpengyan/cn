# 创建流水线

创建流水线时，必须包括一个源阶段和以下一个或两个阶段：

* 构建阶段。

* 部署阶段。

京东云为用户提供了两种创建流水线的方法，包括：

* [快速创建](../Getting-Started/Quick-Creation.md)

* [自定义创建](../Getting-Started/Create-Customized-Instance.md)

其中，使用快速创建时，流水线会创建阶段名为source、build、deploy的三个阶段，您可以为这些阶段添加更多的操作。

## 操作步骤
1. 创建流水线
如果需要根据推荐模板快速创建，创建方式选择 快速创建。也可以使用自定义创建的方式，根据自己的业务情况创建流水线。

	流水线名称：您需要设置创建的流水线名，名称不可为空，只支持中文、数字、大小写字母、英文下划线“ _ ”及中划线“ - ”，且不能超过32字符。

2. 创建源阶段
快速创建时，该阶段的名字默认为source，支持用户修改阶段名。一个阶段包含一个或多个操作（最多5个操作）。各阶段串行执行，阶段内的操作并行执行。一个阶段内的任意一个操作执行失败，即视为该阶段执行失败。


	模板中的源代码操作元素如下：

	- 操作名称：源代码操作
	- 操作类型：源代码
	- 代码源：京东云-代码托管、GitHub
	- 代码库：选择repo地址
	- 分支：编译分支
	- Webhook触发：选择【是】，表示在源代码中发生更改时，自动触发流水线

	

3. 创建编译阶段
快速创建时，该阶段的名字默认为build，支持用户修改阶段名。

	模板中的构建操作元素如下：
	
	- 操作名称：构建操作
	- 操作类型：构建
	- 操作提供方：云编译
	- 代码源：本构建任务编译的源代码，选择流水线中定义的源代码操作。
	- 应用：选择编译任务。根据上面选择的代码源，将过滤云编译中的编译应用。
	- 手工确认：如选择手工确认，该操作将在用户点击确认后执行。默认自动执行。

4. 创建部署阶段
快速创建时，该阶段的名字默认为deploy，支持用户修改阶段名。

	模板中的构建操作元素如下：
	
	- 操作名称：部署操作
	- 操作类型：部署
	- 操作提供方：Kubernetes集群
	- 集群：Kubernetes集群中对应的项目。选择用户已在京东云控制台中创建的kubernetes集群。或者前往控制台创建kubernetes集群，然后返回此任务
	- 上传yaml：上传集群部署配置文件
	- 镜像：列出部署文件中使用的镜像。用户可以使用构建产出的镜像做替换，点击替换按钮，选择构建操作。请确保编译任务（构建操作）的构建类型为镜像。
	- 手工确认：如选择手工确认，该操作将在用户点击确认后执行。默认自动执行。
	
  保存，完成根据模板创建。

点击导航中的加号，可以添加更多阶段。也通过自定义创建的方式，创建符合自己业务逻辑的流水线。