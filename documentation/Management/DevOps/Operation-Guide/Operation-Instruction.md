# 使用须知


**登录操作**

![Alttext](https://github.com/jdcloudcom/cn/blob/DevOps/image/DevOps/Operation32.png)

提供两种方式登录方式：

1）点击京东云账户，将跳转到京东云账户登录页面，用户可使用京东云账户直接登录

2）使用已有DevOps用户名，直接输入用户名密码登录（用户可由DevOps租户管理员进行创建，详见账户管理）

对于初次使用DevOps的京东云账户，请使用第一种方式进行登录。登录后，DevOps系统会引导创建租户。点击立即注册后，会进入到DevOps首页


**安装Agent**

在云主机中，需安装超级Agent，用于部署和管理使用。

具体方法如下：

```
curl -fsSL http://deploy-code-vpc.jdcloud.com/dl-ifrit-agents/install | bash
```

在第三方主机（物理机or虚机）中，请确保主机满足两个条件（联通公网+NTP正常）

安装Agent的方法如下：

```
wget -c http://devops-hb.oss.cn-north-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.448.0742c84.20190327191802.bin -O installer && sh installer -- -t $tenant -r $region -v $vpc -a zero-agent,hawkeye-agent,log-agent,ark-query /usr/local/share/jcloud/ifrit && rm -f installer
    -t tenant #devops中的租户名
    -v vpc    #由用户编写,将作为服务器的vpc名称
    -r region #由用户编写,将作为服务器的region名称
```

关于Agent的说明如下：

| 进程      |    说明 |  端口 |
| :--------: | :--------:|:--------:|
| ifrit-agent  | 管理进程 | 1234 |
| ifrit-supervise  | 管理进程 | |
| hawkeye-agent  | 用于监控 | 1235 |
| log-agent  | 用于日志采集 | |
| zero-agent  | 控制系统agent，用于部署、初始化、日志查询等 | |
