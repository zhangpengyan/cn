# 攻击告警设置

您可以在消息中心对告警消息的接收进行设置，确定需要接收消息告警的人和接收方式。

## 注意事项
- 告警设置对全局生效，包括 **DDoS基础防护** 、 **DDoS防护包** 和 **IP高防** 。

## 配置告警通知方式
告警的账号联系人和通知方式，请在 **消息中心** 进行配置。
1. 如果已登录控制台，请在控制台右上方，找到 **消息** ，进入消息-->消息设置页。
![消息中心](https://github.com/jdcloudcom/cn/blob/edit/image/Advanced%20Anti-DDoS/message%2001.png)
或直接登录[消息中心](https://uc.jdcloud.com/message/mine)。
2. 切换到 **消息设置页**  
![消息中心](https://github.com/jdcloudcom/cn/blob/edit/image/Advanced%20Anti-DDoS/message%2002.png)
在安全消息类汇总，可以编辑消息发送的邮箱、手机，及确定是否接受消息告警。</BR>

##  配置告警通知类型

IP高防支持对单个实例进行DDoS攻击告警、错误码状态告警、黑洞告警三种类型进行配置。请在实例详情下，如图所示位置进行配置：

![告警通知](https://github.com/jdcloudcom/cn/blob/Anti-DDoS/image/Advanced%20Anti-DDoS/alarm.png)

请注意，如果告警方式中短信和邮件关闭，则无论告警类型是否勾选，均无法告警。

告警类型包括如下：

- DDoS攻击告警通知：即攻击产生的告警、攻击结束的告警、未备案告警、带宽受限告警等信息的推送。
- 错误码状态告警：即针对已添加的域名，当常见的错误页面比例达到5%、10%、30%、50%时触发的告警通知。如Error 422（禁止访问）、Error 420（请求重入）、522（源站不可达）等非2XX、3XX的错误页面。
- 黑洞告警通知：即黑洞开始和解封的告警通知。

## 查看告警通知
1. 登录 [消息中心](https://uc.jdcloud.com/message/mine)。
2. 在我的消息–>安全消息中，可以查看所有高防的安全消息告警。
![消息中心](https://github.com/jdcloudcom/cn/blob/edit/image/Advanced%20Anti-DDoS/message%2003.png)
