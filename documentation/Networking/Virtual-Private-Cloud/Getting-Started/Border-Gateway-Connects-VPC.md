##  **边界网关连通私有网络**

**业务场景**

华北地区，两个VPC有通过内网IP的通信需求，详情如下：

- 第一个VPC

  - 名称：VPCforBGWA
  - ID：vpc-xxvpcforbgwaxx
  - 范围：10.0.0.0/16

- 第二个VPC

  - 名称：VPCforBGWB
  - ID：vpc-xxvpcforbgwbxx
  - 范围：192.168.0.0/16

![](/image/Networking/Virtual-Private-Cloud/Getting-Started/Border-Gateway-Connects-VPC/Step1-1.png)

![](/image/Networking/Virtual-Private-Cloud/Getting-Started/Border-Gateway-Connects-VPC/Step1-2.png)

**第一步：创建边界网关**

1) 登录控制台，在产品菜单的网络栏目中点击专线服务，然后在专线服务菜单中点击边界网关，进入边界网关列表页。

2) 在边界网关列表页点击创建，打开创建边界网关创建窗口。

![](/image/Networking/Virtual-Private-Cloud/Getting-Started/Border-Gateway-Connects-VPC/Step2-1.png)

3) 在边界网关创建窗口中配置网关名称，点击确定完成创建，列表页显示新创建的边界网关信息。配置信息如下

- 地域选择华北
- 名称填写BGWA-B

![](/image/Networking/Virtual-Private-Cloud/Getting-Started/Border-Gateway-Connects-VPC/Step2-2.png)

**第二步：为需要连通的VPC配置BGW路由策略**

1) 在边界网关列表页点击“编辑路由策略”前往编辑路由信息

- 配置下一跳指向VPCforBGWA的路由
- 配置下一跳指向VPCforBGWB的路由

![](/image/Networking/Virtual-Private-Cloud/Getting-Started/Border-Gateway-Connects-VPC/Step3-1.png)

**第三步：为需要连通的私有网络创建路由表**

1) 登录控制台，在产品菜单的网络栏目中点击私有网络，然后在私有网络菜单中点击路由表，进入路由表列表页。

2) 在路由表列表页点击创建，打开路由表创建弹窗。

3) 在路由表创建弹窗中配置路由表基本信息，点击确定完成创建。弹窗“显示创建路由表后需要配置路由策略，并关联子网才能生效。是否去配置？”，选择立即配置进入路由表详情页。

路由表配置信息如下：

- 地域选择华北
- 私有网络选择VPCforBGWA
- 名称填写RTBforBGWAtoB

![](/image/Networking/Virtual-Private-Cloud/Getting-Started/Border-Gateway-Connects-VPC/Step4-1.png) 

4) 在路由表详情页中，点击路由策略tab，然后点击编辑，开启路由编辑模式，点击新增一条开始编辑新的路由条目。

5) 在路由条目中填入相关配置，点击保存完成路由表编辑。详细配置如下：

- 目的端填写192.168.0.0/16
- 下一跳类型选择边界网关
- 下一跳选择BGWA-B
- 如果需要公网访问，还需要添加0.0.0.0/0到internet的路由规则。

![](/image/Networking/Virtual-Private-Cloud/Getting-Started/Border-Gateway-Connects-VPC/Step4-2.png)

6) 配置完路由表需将路由表绑定至需要互通的子网。

![](/image/Networking/Virtual-Private-Cloud/Getting-Started/Border-Gateway-Connects-VPC/Step4-3.png) 
7）在第二个VPC中使用同样的步骤创建并配置路由表RTBforBGWBtoA。

配置完成后两端VPC即可通过内网IP建立连接。同理，可以通过边界网关连通同地域下多个私有网络(支持VPC Hub功能)。
