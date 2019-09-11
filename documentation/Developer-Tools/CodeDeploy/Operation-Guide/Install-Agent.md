## Agent安装

目前仅支持Linux中安装Agent。

**安装**

在新建/编辑部署组，选择部署目标时，将自动获取到Agent状态。

手动安装，请登录到待安装/异常主机，执行以下命令

```
curl -fsSL http://deploy-code-vpc.jdcloud.com/dl-ifrit-agents/install_deploy | bash
```

以向华北-北京地域的云主机安装Agent为例，

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/starting20.png)


**获取Agent状态**

Agent状态为“正常”、“异常”两种。


**版本升级**

当Agent发布新版本时，将自动进行版本升级，且更新过程对用户透明，不会影响云部署的功能使用。
