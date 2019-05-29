# 开启DDoS基础防护

**前提条件**

- 已注册京东云账号，并完成实名认证。如果还没有账号请[注册](https://accounts.jdcloud.com/p/regPage?source=jdcloud%26ReturnUrl=%2f%2fuc.jdcloud.com%2fpassport%2fcomplete%3freturnUrl%3dhttp%3A%2F%2Fuc.jdcloud.com%2Fredirect%2FloginRouter%3FreturnUrl%3Dhttps%253A%252F%252Fwww.jdcloud.com%252Fhelp%252Fdetail%252F734%252FisCatalog%252F1)，或[实名认证](https://uc.jdcloud.com/account/certify).

**操作步骤**

1、请确认已经拥有了京东云内的公网IP。

a. 弹性公网IP的确认方式：

请登录京东云[弹性公网IP 控制台](http://cns-console.jdcloud.com/host/pip/list),控制台目录为“网络->私有网络->弹性公网IP”目录下，确认已经添加了弹性公网IP。
![创建弹性公网IP实例](https://github.com/jdcloudcom/cn/blob/Anti-DDoS/image/Basic%20Anti-DDos/instance%2003.png)

b. 云物理服务器的确认方式：

请登录京东云[云物理服务器 控制台](http://cps-console.jdcloud.com/list),控制台目录为“超融合数据中心->云物理服务器”目录下，确认已经添加了实例。


2、切换到云安全菜单下的DDos基础防护，您已购买的弹性公网IP或云物理服务器IP已经自动加入基础防护。

![创建实例](../../../../image/Basic%20Anti-DDos/Instance02.png)

**注意**：基础防护是默认开启的，无法关闭。 如某公网IP已经在防护包实例里进行里绑定，则黑洞阈值将显示其最终在防护包中的黑洞阈值。

# 相关参考
- [什么是DDoS基础防护](../Introduction/Product-Overview.md)
- [功能特性](../Introduction/Features.md)
- [基础架构](../Introduction/Basic-Infrastructure.md)
