## Jenkins插件

**版本要求**

不低于2.7.3


**安装插件**

在Jenkins中，支持通过直接安装和上传插件两种方式，来安装云部署插件。

1、直接安装

在Jenkins中，由“系统管理”-->"管理插件"，可进入到管理插件页面。

搜索“JDCloud CodeDeploy”即可按照插件。

2、上传插件

用户可先将插件下载到本地，下载地址为：https://jdcloud-codedeploy.oss.cn-north-1.jcloudcs.com/jdcloud-codedeploy.hpi

之后，点击Jenkins插件管理中的“高级”，在“上传插件”中，点击“选择文件”，选择已下载的插件，进行安装。

**使用插件**

前提：

- Jenkins可联通公网
- 在云部署中已有应用、部署组
- 已知京东云控制台AKSK
- 符合云部署规范，即在代码根目录有jdcloud-codedeploy.yml文件

在Jenkins中，进入到“构建后操作”，填写以下内容：

- 应用名称：云部署中已有的应用名称
- 部署组名称：云部署中已有的部署组名称
- 地域：云部署中应用所在地域
- 打包路径：工作空间中的指定目录，为符合云部署规范，请确保jdcloud-codedeploy.yml文件在该目录顶部
- 包含文件：工作空间中的包含文件
- 排除文件：工作空间中的排除文件
- AccessKey：用于发起部署任务的京东云Access and Secret Key
- SecretKey：用于发起部署任务的京东云Access and Secret Key
- 触发部署：是否自动触发云部署，来部署最新编译的结果
- 等待部署结果：是否等待部署结果
- 使用京东云存储：若选择此选项，那么Jenkins构建后的产出物将自动存储到对象存储的指定空间和目录中，用于部署
- 根据URL获取部署包：若选择此选项，将部署指定URL的内容


