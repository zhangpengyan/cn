# 安装Edge系统失败

## 问题描述

我无法在设备上安装Edge系统。

## 问题处理

1. 请执行下方指令确认您是否已经正确安装 docker 和 docker-compose，已安装会返回正确版本号。

```
docker --version
docker-compose --version
```

2. 请按照下方所述方法确认您下载的安装包是否正确。

   - 进入边缘节点详情页，点击查看配置信息，记录安装包MD5值，并将其保存为md5.txt文件，内容如下：
```
e0ierfndmjs9a7649b6f2cm3d8gbfu387 jdc-edge-install.tar.gz
```
   - 将md5.txt和jdc-edge-install.tar.gz安装包放至同一目录下，输入下方指令，校验安装包是否正确

```
md5sum -c md5.txt
```

3. 请确认您填写的用户配置文件（UserConfig.toml）是否正确，具体请参考 [安装Edge系统](../Getting-Started/Install-Edge-System.md) 。

   

4. 请确认您的设备配置已经满足[产品规格](../Introduction/Specifications.md)中所列的全部要求。

   

5. 请确认您设备的网络连接是否正常。

## 后续处理

  如通过以上操作仍未解决问题，请 [提交工单](https://ticket.jdcloud.com/myorder/form?cateId=166&questionId=238) 或 致电客服 400-615-1212 。
