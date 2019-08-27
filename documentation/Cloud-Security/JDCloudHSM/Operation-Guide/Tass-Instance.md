# 江南天安金融加密机 - 实例初始化

## 准备工作

1. 首先需要将自己的操作电脑使用VPN方式，接入到VPC
2. 将自己电脑在VPC中的地址，加入到数据加密服务实例的白名单中
3. 下载VsmManager配套软件
4. 准备好京东云寄出的配套UKey

## 修改UKey密码

打开软件包中的VsmManager软件，点击“设备管理”，插入UKey并刷新；对UKey进行“更改口令操作”；默认UKey的口令为“12345678”。

![修改密码](/image/JDCloudHSM/Tass/修改密码.png)

## 初始化过程

1. 打开软件包中的VsmManager软件，点击“VSM登陆管理”，在弹出窗口中点击“注册管理员”

![打开软件](/image/JDCloudHSM/Tass/打开软件.png)

2. 插入一个空白的UKey，刷新后并选择该UKey，输入UKey的密码，此UKey即将作为登陆数据加密服务实例的管理UKey。

![注册管理员](/image/JDCloudHSM/Tass/注册管理员.png)

3. 点击登陆，并用刚刚制作好的管理员UKey登陆；管理员UKey在整个管理过程中不要拔出。

4. 点击“密钥管理”，点击“原始初始化”，“原始初始化”的作用是初始化一台新的数据加密实例。

![原始初始化01](/image/JDCloudHSM/Tass/原始初始化01.png)

5. 点击“下一步”，输入“成分”数目；“成分”为制作数据加密实例根密钥的因子，可选2~8个。这里示例为2个。

![原始初始化02](/image/JDCloudHSM/Tass/原始初始化02.png)

6. 软件上点击“随机秘密值”后点击“产生成分UKey”

![原始初始化03](/image/JDCloudHSM/Tass/原始初始化03.png)

7. 再插入一个新的UKey，作为第一个成分UKey；点击“确定”并输入密码，第一个成分UKey就制作好了。

![原始初始化04](/image/JDCloudHSM/Tass/原始初始化04.png)

8. 按照相应的过程，制作第二个成分UKey

![原始初始化05](/image/JDCloudHSM/Tass/原始初始化05.png)

9. 依次插入刚刚制作好的成分UKey，作为DMK的合成因子。

![原始初始化06](/image/JDCloudHSM/Tass/原始初始化06.png)

10. 点击合成DMK，设备的根密钥就初始化好了。

![原始初始化07](/image/JDCloudHSM/Tass/原始初始化07.png)

11. 选择授权机制，这里示例使用1选1授权机制

![原始初始化09](/image/JDCloudHSM/Tass/原始初始化09.png)

| 授权机制 | 描述 |
| -- | -- |
| 无授权 | 数据加密示例无任何授权，插入管理员UKey即可操作，不建议 |
| 1选1授权 | 使用一个授权UKey，在管理数据加密服务实例时需要插入该授权UKey |
| 3选2授权 | 使用三个授权UKey，在管理数据加密服务实例时需要插入其中的两个授权UKey |
| 5选3授权 | 使用五个授权UKey，在管理数据加密服务实例时需要插入其中的三个授权UKey |

12. 初始化授权UKey

![原始初始化10](/image/JDCloudHSM/Tass/原始初始化10.png)

13. 数据加密服务的初始化就完成了。

![原始初始化11](/image/JDCloudHSM/Tass/原始初始化11.png)


## 相关参考

[VsmManager配套软件下载](https://docs-downloads.s3.cn-north-1.jdcloud-oss.com/CloudHSM/VsmManager_1.2.2.15.rar)

[江南天安EVSM使用手册下载](/image/JDCloudHSM/云加密服务-EVSM管理工具用户使用手册V1.3.pdf)

[江南天安金融加密机应用开发手册](/image/JDCloudHSM/江南天安金融数据密码机应用开发手册_V1.48.pdf)
