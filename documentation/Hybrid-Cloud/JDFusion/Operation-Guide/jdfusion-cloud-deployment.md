
# Deployment操作说明
## 概述
　　Deployment是一种用户可编辑的资源编排档案。混合云Deployment功能以模板为标准去批量描述资源的配置信息和依赖关系，实现资源的统一部署，并且通过其特有的反向部署模式，可以实现同云平台和跨云平台的资源配置备份，以及资源的恢复和复制。通过Deployment定义，部署引擎能够完成资源的自动化构建和部署工作，实现资源的统一管理和自动化运维等目的 。

- 支持界面可视化操作和编辑
- 支持“标准”JSON风格的语法，可变身为代码编辑器；
- 支持资源编排部署的历史变更变更记录查看及回滚；
- 支持灵活的变量定义和引用；
- 支持属性在资源间灵活的相互引用；
- 支持详尽的执行报告查看；
- 支持Deployment克隆功能；

## 应用场景

- ### 资源批量创建
  通过创建Deployment，并启动执行，能够批量创建，灵活构建各种应用场景，具体操作流程如下：

![创建实例](https://github.com/jdcloudcom/cn/blob/edit/image/JDFusion/create-reses.png)

 1. 首先进入Deployment创建页面，选择云平台，填写名称，描述等基本信息后，点击增加资源按钮，进行资源的批量维护


![创建实例](https://github.com/jdcloudcom/cn/blob/edit/image/JDFusion/create-deployment.png)


 2. 选择资源类型，并填写资源别名（注：资源别名仅用于构建引擎创建资源时使用，不会附加在资源的任何属性之上，不要与资源名称混淆），并点击下一步进入资源属性编辑界面（该处操作与资源管理的创界页面基本一致），填写完整后，点击‘确定’，完成该待增资源的描述定义，如果继续增加其他资源，则重复操作此过程即可，最后点击提交


![创建实例](https://github.com/jdcloudcom/cn/blob/edit/image/JDFusion/add-resources-1.png)

![创建实例](https://github.com/jdcloudcom/cn/blob/edit/image/JDFusion/add-resources-3.png)


 3. Deployment创建成功后，会在列表页面查询到该记录，点击右侧‘执行’按钮，开始执行编排任务，进行资源构建（注：同一Deployment记录可反复修改和执行，构建引擎会比较每一次修改的变化情况进行差异化构建，系统支持针对每次执行结果进行回滚）


![创建实例](https://github.com/jdcloudcom/cn/blob/edit/image/JDFusion/demolist-deployment.png)


 4. 针对Deployment启动执行操作后，会收到‘Deployment执行已经进入任务队列’的提示，待任务执行完毕后，将会收到系统发来消息，报告执行结果，点击可查看详情（注：如果任务执行失败，可在执行报告中查看到详细的失败原因）


![创建实例](https://github.com/jdcloudcom/cn/blob/edit/image/JDFusion/demolist-deployment.png)

![创建实例](https://github.com/jdcloudcom/cn/blob/edit/image/JDFusion/report-deployment.png)


- #### 资源配置备份及跨云复制构建
  利用Deployment的反向部署功能，能够将云平台既有资源的配置信息导出，并可再次重新启动执行，快速构建资源，恢复应用场景，极大的降低了手工操作的工作量，具体操作流程如下：


![创建实例](https://github.com/jdcloudcom/cn/blob/edit/image/JDFusion/backup-reses.png)


 1. 首先进入Deployment创建页面，选择云平台，填写名称，描述等基本信息后，选择云平台既有资源增加至Deployment，进行资源配置信息的批量导入（该处资源别名规则与Deployment创建规则一致）


![创建实例](https://github.com/jdcloudcom/cn/blob/edit/image/JDFusion/backup-deployment.png)


 2. 为安全起见，反向部署生成的Deployment为只读状态，不可执行和回滚，须克隆后，生成相同的Deployment，并进行操作


![创建实例](https://github.com/jdcloudcom/cn/blob/edit/image/JDFusion/clone-deployment.png)


 3. 针对克隆生成的Deployment进行执行，即可批量构建资源，实现应用场景的备份恢复，并且可修改其云平台属性为其他云平台及其他资源属性，可以非常方便的实现资源的跨云复制，迁移和扩容


## Q&A
- #### JSON CODE编辑模式如何使用？

 - ##### 概述

  Deployment的JSON CODE编辑模式是区别于可视化编辑的一种快速操作方式，它能够使用JSON标准格式代码，快速定义一个Deployment，支持文本的复制，粘贴，剪切等操作，可视化编辑和JSON CODE模式之间可自由切换，互相兼容。
 
 - ####结构说明
```javascript
 {
 "deployment": {
 "info": {
 "name": "", //名称
 "description": "", // 描述
 "version": "", //版本号，默认1.0，暂不接受其他值
 "readOnly": 0 //数值型，0:读写，1:只读
 },
 "content": { //资源描述，对象类型
 "vms": {}, //云主机
 "subnets": {}, //子网
 "networkInterfaces": {}, //弹性网卡
 "vpcs": {}, //私有网络
 "keypairs": {}, //秘钥对
 "disks": {}, //云硬盘
 "eips": {}, //弹性公网IP
 "diskAttachment": {}, //磁盘挂载
 "eipAssociate": {}, //弹性公网IP
 "netInterfaceAttachment": {}, //网卡挂载
 "slbs": {}, //负载均衡
 "vserverGroups": {}, //负载均衡虚拟服务器组
 "httpListeners": {}, //负载均衡监听器
 "rds": {}, //云数据库RDS实例
 "rdsDatabase": {}, //RDS数据库
 "rdsAccount": {}, //RDS账号
 "rdsAccountGrant": {}, //账号授权
 "bucket": {}, //对象存储
 "avaiGroup": {}, //高可用组
 "instanceTemplate": {}, //实例模板
 "variables": {} //变量定义
 }
 }
}
```
说明：资源描述规范格式，可先增加资源后，点击JSON CODE进行查看

 - 限制说明
   * 通过JSON CODE模式进行资源编排，不会进行字段有效性验证以及业务合法性验证（如：IP地址格式是否标准，是否属于CIDR范围之内等），请谨慎操作

- #### 如何使用变量快速构建编排模板？

 - 概述
   - 在创建Deployment时，使用变量可提高编排模板的灵活性和可复用性。使用资源变量，可实现资源之间的预关联。例如，要批量构建一套应用，包含1个私有网络，1个子网，1个云主机实例，一个公网IP，并且所有资源的名称均为“web-a”。可以按照如下示例，在Deployment中定义参数：
```json
{
 "deployment": {
 "info": {
 "cloudID": "9b73cc4e-ffc8-4ca0-b628-ecd909d13a8f",
 "name": "application-demo",
 "description": "application",
 "version": "1.0",
 "readOnly": 0
 },
 "content": {
 "eipAssociate": {
 "eip_associate_1": {
 "cloudID": "9b73cc4e-ffc8-4ca0-b628-ecd909d13a8f",
 "instanceId": "${vms.vm_instance_1.id}",
 "eipId": "${eips.eip_1.id}",
 "instanceType": "vm"
 }
 },
 "vpcs": {
 "vpc_1": {
 "cloudID": "9b73cc4e-ffc8-4ca0-b628-ecd909d13a8f",
 "name": "${variables.name}",
 "description": "",
 "cidrBlock": "192.168.0.0/16"
 }
 },
 "subnets": {
 "subnet_1": {
 "cloudID": "9b73cc4e-ffc8-4ca0-b628-ecd909d13a8f",
 "az": "cn-qingdao-c",
 "vpcId": "${vpcs.vpc_1.id}",
 "cidrBlock": "0.0.0.0/0",
 "description": "",
 "name": "${variables.name}"
 }
 },
 "vms": {
 "vm_instance_1": {
 "az": "cn-qingdao-c",
 "name": "${variables.name}",
 "hostName": "",
 "description": "",
 "vpcId": "${vpcs.vpc_1.id}",
 "subnetId": "${subnets.subnet_1.id}",
 "tags": [],
 "privateIpAddress": "",
 "imageId": "coreos_2023_4_0_64_30G_alibase_20190319.vhd",
 "instanceFlavorType": "ecs.se1.large",
 "securityGroupId": "${sgs.sg_1.id}",
 "internetMaxBandwidthIn": 1,
 "internetMaxBandwidthOut": 1,
 "password": "",
 "passwordInherit": false,
 "userData": "",
 "keyPairName": "",
 "systemDisk": {
 "category": "cloud_ssd",
 "diskSize": 40,
 "description": ""
 }
 }
 },
 "eips": {
 "eip_1": {
 "cloudID": "9b73cc4e-ffc8-4ca0-b628-ecd909d13a8f",
 "name": "eip",
 "bandwidth": 1,
 "provider": "bgp"
 }
 },
 "variables": {
 "name": "web-a"
 }
 }
 }
}


```
 - 变量选择器使用说明
 1. 为方便使用变量，系统提供了变量选择器，可快速进行变量提取以及使用，在添加资源的页面，点击下部‘使用变量’按钮，即可调出变量选择器，选择变量并点击复制后，即可在任意位置粘贴使用


![创建实例](https://github.com/jdcloudcom/cn/blob/edit/image/JDFusion/res-variables.png)






