## 自定义解析线路

1、登录京东云控制台，进入域名解析界面，点击输入的主域名或点击解析按钮进入解析操作页面。

 ![img](https://github.com/jdcloudcom/cn/blob/edit/image/dns-img/Custom-Route1.png)
 
2、点击标签栏中的自定义线路标签。

![img](https://github.com/jdcloudcom/cn/blob/edit/image/dns-img/Custom-Route2.png)

3、点击添加线路按钮，在弹出的对话框中输入线路名和线路地址，线路地址仅支持CIDR格式同IP段范围格式。（例1.1.1.1/24或1.1.1.1-2.2.2.2）

![img](https://github.com/jdcloudcom/cn/blob/edit/image/dns-img/Custom-Route3.png)

4、添加自定义线路后会在解析线路中显示此条线路（如下图的test），系统会优先匹配自定义的解析线路。

![img](https://github.com/jdcloudcom/cn/blob/edit/image/dns-img/Custom-Route4.png)

5、自定义解析线路支持删除，当且仅当无任何解析记录在使用此条线路时可以删除。

![img](https://github.com/jdcloudcom/cn/blob/edit/image/dns-img/Custom-Route5.png)
