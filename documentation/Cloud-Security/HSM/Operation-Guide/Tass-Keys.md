# 江南天安金融加密机 - 密钥管理
 
## 准备工作

1. 首先需要对数据加密服务进行初始化 [操作步骤](Tass-Instance.md)

## 进行授权

1. 打开VsmManager软件，并使用管理员UKey登陆

2. 点击“设备管理”，点击“操作授权”

![授权01](/image/HSM/Tass/授权01.png)

3. 插入授权UKey，点击确定，并输入UKey密码

![授权02](/image/HSM/Tass/授权02.png)

4. 在弹出窗口中，修改“应用密钥管理”的授权时间，这里以30分钟为示例（30分钟内可以使用管理员UKey进行密钥管理）

![授权04](/image/HSM/Tass/授权04.png)

5. 在VsmManager软件中点击“密钥管理”，点击“对称密钥管理”

![密钥管理01](/image/HSM/Tass/密钥管理01.png)

6. 点击“产生随机密钥”，并在弹出窗口中补全所需信息

![密钥管理02](/image/HSM/Tass/密钥管理02.png)

7. 我们示例选择创建AES算法且索引为1的密钥

![密钥管理03](/image/HSM/Tass/密钥管理03.png)

8. 点击“产生”，并在密钥管理窗口点击“刷新”，新创建的密钥就显示出来。

![密钥管理04](/image/HSM/Tass/密钥管理04.png)



## 相关参考

[VsmManager配套软件下载](https://docs-downloads.s3.cn-north-1.jdcloud-oss.com/HSM/VsmManager_1.2.2.15.rar)

[江南天安EVSM使用手册下载](https://docs-downloads.s3.cn-north-1.jdcloud-oss.com/HSM/%E4%BA%91%E5%8A%A0%E5%AF%86%E6%9C%8D%E5%8A%A1-EVSM%E7%AE%A1%E7%90%86%E5%B7%A5%E5%85%B7%E7%94%A8%E6%88%B7%E4%BD%BF%E7%94%A8%E6%89%8B%E5%86%8CV1.3.pdf)

[江南天安金融加密机应用开发手册](https://docs-downloads.s3.cn-north-1.jdcloud-oss.com/HSM/%E6%B1%9F%E5%8D%97%E5%A4%A9%E5%AE%89%E9%87%91%E8%9E%8D%E6%95%B0%E6%8D%AE%E5%AF%86%E7%A0%81%E6%9C%BA%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E6%89%8B%E5%86%8C_V1.48.pdf)

