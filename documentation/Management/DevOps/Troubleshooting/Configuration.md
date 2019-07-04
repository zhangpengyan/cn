# 配置类问题

**1. build.sh如何编写**

需要在代码库的根目录添加编译脚本

编译步骤： 

1）构建代码 

2）copy产出包到output目录 

线上部署目录如下：
```
/export/ 
- servers/ # 基础系统软件目录 
- Backup/ # 【包部署】存放编译包的备份目录 
- Packages/ # 程序目录（包+配置文件） 
  - appKey/ # 【包部署】应用键值 
    - latest -> /export/Packages/moduleName/version # 软链到对应最新版本 
    - version # 版本号 
- Instances/ # 实例目录 
  - appKey/ # 应用键值名称 
    - 0.app_key/ # 实例名称 
       - runtme ->/export/Packages/moduleName/version # 软链到部署的版本号包的存放目录 
       - log ->/export/Logs/appKey/0.app_key # 软链到log目录 
       - data ->/export/Data/appKey/0.app_key # 软链到data目录 
- Logs/ # 日志目录 
  - appKey # 应用键值 
    - 0.app_key/ # 实例名称 
- Data/ # 数据存放目录 
  - appKey/ # 应用键值 
    - 0.app_key/ # 实例名称
```

示例请参见：[编译构建](https://github.com/jdcloudcom/cn/blob/DevOps/documentation/Management/DevOps/Operation-Guide/CI.md) 中的规范

**2. control脚本是什么**

在代码根目录下 bin/增加control 脚本，用来启动、停止、服务健康检查 

示例请参见：[编译构建](https://github.com/jdcloudcom/cn/blob/DevOps/documentation/Management/DevOps/Operation-Guide/CI.md) 中的规范

