# 在云主机中安装超级Agent

在云主机中，需安装超级Agent，用于部署和管理使用。

具体方法如下:

```
curl -fsSL http://deploy-code-vpc.jdcloud.com/dl-ifrit-agents/install | bash
```

关于Agent的说明如下：

| 进程      |   说明  | 端口  |
| :--------: | :--------:| :--: |
| ifrit-agent  | 管理进程 |  1234 |
| ifrit-supervise  | 管理进程 |  |
| hawkeye-agent  | 用于监控 |  1235 |
| log-agent  | 用于日志采集 |   |
| zero-agent  | 控制系统agent ，用于部署、初始化、日志查询等 |   |
