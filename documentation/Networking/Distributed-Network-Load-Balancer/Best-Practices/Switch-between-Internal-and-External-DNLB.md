# 私网和公网负载均衡转换

  可根据具体的业务场景选择配置公网或私网类型的分布式网络负载均衡。私网负载均衡和公网负载均衡可相互转换。

## 私网负载均衡

- 私网负载均衡只能在京东云内网使用，可以转发对京东云内网具有访问权限的客户端请求。创建私网负载均衡的步骤如下：
  创建负载均衡时选择 **暂不购买** 公网IP，完成相关资源配置，则创建的私网负载均衡实例。
  
  ![私网DNLB](../../../../image/Networking/Distributed-Network-Load-Balancer/DNLB-010.png)
## 公网负载均衡

- 公网负载均衡可以将来自公网的访问请求转发至后端服务器，公网负载均衡需要单独购买公网IP，步骤如下：
    购买负载均衡时选择公网IP（不超过公网IP可创建配额），系统会自动为负载均衡创建并绑定一个公网IP。
    
  ![公网DNLB](../../../../image/Networking/Distributed-Network-Load-Balancer/DNLB-011.png)

## 私网负载均衡与公网负载均衡互转

- 京东云支持私网和公网负载均衡类型互转，私网负载均衡可通过绑定公网IP转换为公网负载均衡，公网负载均衡可通过解绑公网IP转换为私网负载均衡。

公网负载均衡转换为私网负载均衡：
  ![DNLB私网转换为公网](../../../../image/Networking/Distributed-Network-Load-Balancer/DNLB-012.png)

私网负载均衡转换为公网负载均衡：
  ![DNLB公网转换为私网](../../../../image/Networking/Distributed-Network-Load-Balancer/DNLB-013.png)

	


	
