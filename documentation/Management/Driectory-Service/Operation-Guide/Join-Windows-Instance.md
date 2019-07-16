### 手动加入目录服务域控

1.登录需要加入域控的虚拟主机，选择打开网络和共享中心，选择链接后的以太网，点击属性后选择Internet协议版本4

![img](https://github.com/jdcloudcom/cn/blob/joytaobao-ad-2019011501/image/DirectoryService/cn/Join-Windows-Instance-cn-1.png)

2.将DNS服务修改成目录服务的DNS网址，点击确定

![img](https://github.com/jdcloudcom/cn/blob/joytaobao-ad-2019011501/image/DirectoryService/cn/Join-Windows-Instance-cn-2.png)

3.点击开始选择这台电脑，点击属性中的更改

![img](https://github.com/jdcloudcom/cn/blob/joytaobao-ad-2019011501/image/DirectoryService/cn/Join-Windows-Instance-cn-3.png)

4.在新窗口中选择域，输入目录服务的DNS网址

![img](https://github.com/jdcloudcom/cn/blob/joytaobao-ad-2019011501/image/DirectoryService/cn/Join-Windows-Instance-cn-4.png)

5.输入目录服务的用户名和密码（在创建目录服务时候用户名默认为Admin，密码为自定义设置的）

![img](https://github.com/jdcloudcom/cn/blob/joytaobao-ad-2019011501/image/DirectoryService/cn/Join-Windows-Instance-cn-5.png)

6.加域成功后重新启动计算机即可

![img](https://github.com/jdcloudcom/cn/blob/joytaobao-ad-2019011501/image/DirectoryService/cn/Join-Windows-Instance-cn-6.png)