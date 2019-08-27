# HTTP/HTTPS后端服务

API网关不仅支持在发布API分组的过程中为分组配置统一的后端服务，还支持在高级配置中，由用户自行为API配置单独的HTTP/HTTPS后端服务。

#### 入口一：
互联网中间件>API网关>API分组管理> API列表>发布

#### 入口二：
互联网中间件>API网关>API分组管理> 版本修订列表>发布

#### 入口三：
互联网中间件>API网关>API分组管理> API列表，选择API并点击操作中的高级配置功能。




## 操作步骤：

- 在API列表页，点击“发布”按钮后，可通过填写后端服务地址为该API分组配置统一的HTTP/HTTPS后端。
  ![API列表](../../../../../image/Internet-Middleware/API-Gateway/back-end-HTTP1.png)

- 在版本修订列表页，点击“发布”按钮后，可通过填写后端服务地址为该API分组配置统一的HTTP/HTTPS后端。
 ![API列表](../../../../../image/Internet-Middleware/API-Gateway/back-end-HTTP2.png)

- 在高级配置中，当不勾选“在发布分组时统一配置”时，可选择HTTP/HTTPS的后端服务类型，填入API调用的真实后端服务地址，从而为当前API配置HTTP/HTTPS类型的后端。
  ![API列表](../../../../../image/Internet-Middleware/API-Gateway/back-end-HTTP3.png)


##  配置规则：
- API分组可以配置的后端服务：HTTP/HTTPS、Mock
- API可以配置的后端服务：HTTP/HTTPS、Mock、函数(Function Service)
- 当某个API分组中所有接口都是同一个后端时，只需给该分组配置后端；当某个API分组中的大部分接口是同一个后端，少数为其他后端时，可以给分组配置数量较多的后端，给其他后端的API单独配置。


