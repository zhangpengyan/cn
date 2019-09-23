# 江南天安金融加密机 - 密钥管理
 
## 准备工作

1. 首先需要对数据加密服务进行初始化 [操作步骤](Tass-Instance.md)

## 进行授权

1. 打开VsmManager软件，并使用管理员UKey登陆

2. 点击“设备管理”，点击“操作授权”

![授权01](/image/JDCloudHSM/Tass/授权01.png)

3. 插入授权UKey，点击确定，并输入UKey密码

![授权02](/image/JDCloudHSM/Tass/授权02.png)

4. 在弹出窗口中，修改“应用密钥管理”的授权时间，这里以30分钟为示例（30分钟内可以使用管理员UKey进行密钥管理）

![授权04](/image/JDCloudHSM/Tass/授权04.png)

5. 在VsmManager软件中点击“密钥管理”，点击“对称密钥管理”

![密钥管理01](/image/JDCloudHSM/Tass/密钥管理01.png)

6. 点击“产生随机密钥”，并在弹出窗口中补全所需信息

![密钥管理02](/image/JDCloudHSM/Tass/密钥管理02.png)

7. 我们示例选择创建AES算法且索引为1的密钥

![密钥管理03](/image/JDCloudHSM/Tass/密钥管理03.png)

8. 点击“产生”，并在密钥管理窗口点击“刷新”，新创建的密钥就显示出来。

![密钥管理04](/image/JDCloudHSM/Tass/密钥管理04.png)



## 相关参考

[VsmManager配套软件下载](https://docs-downloads.s3.cn-north-1.jdcloud-oss.com/CloudHSM/VsmManager_1.2.2.15.rar)

[江南天安EVSM使用手册下载](/image/JDCloudHSM/云加密服务-EVSM管理工具用户使用手册V1.3.pdf)

[江南天安金融加密机应用开发手册](/image/JDCloudHSM/江南天安金融数据密码机应用开发手册_V1.48.pdf)
