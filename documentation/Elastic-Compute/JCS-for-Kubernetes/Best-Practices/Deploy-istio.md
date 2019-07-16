# 在Kubernetes集群上运行Istio
在从单体应用程序向分布式微服务架构的转型过程中，开发人员和运维人员面临诸多挑战，Istio 提供了一个完整的解决方案，通过为整个服务网格提供行为洞察和操作控制来满足微服务应用程序的多样化需求。

本文将以1.12.3版集群为例，说明在Kubernetes集群上快速安装Istio的步骤，并提供了服务治理示例。

## 一、安装Istio

1. 在京东云控制台[创建集群][1]，并安装kubectl客户端[连接到集群][2]；
2. 在[Istio版本页面](https://github.com/istio/istio/releases)下载需要的版本，或参考本文示例，直接下载1.0.6；

    ```
    
    wget https://github.com/istio/istio/releases/download/1.0.6/istio-1.0.6-linux.tar.gz

    tar -zxvf istio-1.0.6-linux.tar.gz
    ```

**说明：**

  解压后的目录包含如下内容：

    * install/中包含安装.yaml 文件，可根据需求进行选择安装，本文以istio-demo.yaml为例；
    * samples/中包含示例应用；
    * bin/目录中放置istioctl 客户端二进制文件
3. 进入Istio 安装的根目录，将istioctl客户端添加到PATH，并安装istio-demo；

    ```
    
    export PATH=$PWD/bin:$PATH
    kubectl apply -f install/kubernetes/istio-demo.yaml
    ```

4. 命令执行完后，可以看到集群中新增了一个命名空间istio-system；

    `
    kubectl get namespace
    `
    
    输出如下
    ```
    
    NAME           STATUS   AGE
    default        Active   16h
    istio-system   Active   7m37s
    jke-system     Active   15h
    kube-public    Active   16h
    kube-system    Active   16h
    ```    
5. 等待一段时间后，查看istio-system各主要服务是否已经正常启动；

    `
    kubectl get pod -n istio-system
    `

    输出如下

    ```
    
    NAME                                      READY   STATUS      RESTARTS   AGE
    grafana-5f88cdf98b-mbvgp                  1/1     Running     0          10m
    istio-citadel-5bbbc98c6d-v7kxq            1/1     Running     0          10m
    istio-cleanup-secrets-kgjqx               0/1     Completed   0          10m
    istio-egressgateway-5c65dbd6bc-54mxh      1/1     Running     0          10m
    istio-galley-589df589c9-p82l5             1/1     Running     0          10m
    istio-grafana-post-install-64svr          0/1     Completed   3          10m
    istio-ingressgateway-679d5cdc94-hsrkd     1/1     Running     0          10m
    istio-pilot-74ddc6cf47-4jwhk              2/2     Running     0          10m
    istio-policy-777fbbd848-x7hpf             2/2     Running     0          10m
    istio-security-post-install-4zjnj         0/1     Completed   3          10m
    istio-sidecar-injector-7d559f664c-4qqd2   1/1     Running     0          9m59s
    istio-telemetry-588dd6494-wgtqp           2/2     Running     0          10m
    istio-tracing-6445d6dbbf-88jx4            1/1     Running     0          9m59s
    prometheus-66f96fdfbc-44htl               1/1     Running     0          10m
    servicegraph-658fd9f76d-jrvdp             1/1     Running     0          10m
    ```    
**说明：**

  istio主要组件说明如下：

    * pilot负责服务发现和流量治理；
    * mixer负责访问控制和调用信息收集；
    * ingressgateway作为外部流量的入口；
    * citadel用于证书管理和安全管理；

6. 以上各组件运行正常，则说明istio安装完成；
7. 如需卸载istio，请执行如下命令：

    `
    kubectl delete -f install/kubernetes/istio-demo.yaml
    `
## 二、示例应用

示例应用是一个线上图书目录系统，显示图书相关信息，包括书名、ISBN、页数等图书详情以及图书预览功能，由四个独立的微服务组成，包括详情（detail）、产品页（productpage）、评价（ratings）、星级展示（reviews）。
1. 部署示例应用 ，注入代理服务，执行如下命令：

    `
    kubectl apply -f <(istioctl kube-inject -f samples/bookinfo/platform/kube/bookinfo.yaml)
    `
    
2. 等待一段时间，执行如下命令确定服务已正常启动：

    `
    kubectl get service
    `

    输出如下：

    ```
    
    NAME          TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
    details       ClusterIP   10.0.255.166   <none>        9080/TCP   10s
    kubernetes    ClusterIP   10.0.248.1     <none>        443/TCP    16h
    productpage   ClusterIP   10.0.249.165   <none>        9080/TCP   9s
    ratings       ClusterIP   10.0.249.23    <none>        9080/TCP   10s
    reviews       ClusterIP   10.0.252.48    <none>        9080/TCP   10s 

    ```

    `
    kubectl get pod
    `

    输出如下：

    ```
    
    NAME                              READY   STATUS    RESTARTS   AGE
    details-v1-5c8dc9bffb-5v5bl       2/2     Running   0          3m17s
    productpage-v1-7dd5bcc8c8-z6hpv   2/2     Running   0          3m16s
    ratings-v1-56d96b5d8-9h9lz        2/2     Running   0          3m17s
    reviews-v1-7d9c799d9c-6rvt9       2/2     Running   0          3m17s
    reviews-v2-8d79fbcfb-dxzfw        2/2     Running   0          3m16s
    reviews-v3-6c9c86db7f-gjsrx       2/2     Running   0          3m16s
    ```
    **说明**
    * 输出结果表明，detail, productpage, ratings, reviews四个示例服务已启动，并且reviews启动了3个版本

3. 执行如下命令，定义一个LoadBalance类型的Service作为入口网关；

    `
    kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
    `

    输出结果如下：

    ```
    kubectl get svc istio-ingressgateway -n istio-system
    
    
    NAME                   TYPE           CLUSTER-IP     EXTERNAL-IP      PORT(S)                                                                                                                   AGE
    istio-ingressgateway   LoadBalancer   10.0.250.151   114.XXX.XXX.XXX   80:31380/TCP,443:31390/TCP,31400:31400/TCP,15011:30570/TCP,8060:30615/TCP,853:32610/TCP,15030:30259/TCP,15031:31241/TCP   47m
    ```
4. 使用上一步中集群返回的external-IP和服务名称验证集群中的服务是否运行正常，以productpage微服务为例，执行命令如下：

    ```
    
    curl -I http://{external-IP}/productpage
    
    HTTP/1.1 200 OK
    content-type: text/html; charset=utf-8
    content-length: 5723
    server: envoy
    date: Fri, 19 Apr 2019 09:56:40 GMT
    x-envoy-upstream-service-time: 55
    
   注：external-IP字段使用service绑定的外网IP替换
    ```

5. 或在浏览器中输入地址http://{external-IP}/productpage验证输出结果，多次刷新，可以看到三种不同版本的评价星级随机出现。

6. 依次执行如下命令，进行服务治理，并查看输出结果

  * 执行如下命令取消评价星级展示，刷新上一步中的浏览器地址会发现页面不再展示星级评价内容

    ```
    
    kubectl apply -f samples/bookinfo/networking/destination-rule-all.yaml

    kubectl apply -f samples/bookinfo/networking/virtual-service-all-v1.yaml
    ```

  * 执行如下命令后，刷新上一步中的浏览器地址会发现评价星级在不展示和红色五角星两种情况随机出现

    `
    kubectl apply -f samples/bookinfo/networking/virtual-service-reviews-50-v3.yaml
    `
    
  * 查看上一步操作中对应的yaml文件验证，发现v1和v3两个版本的reviews各50%

    ```
    
    - destination:
        host: reviews
        subset: v1
      weight: 50
    - destination:
        host: reviews
        subset: v3
      weight: 50
    ```
  * 再次执行如下命令后，刷新上一步中的浏览器地址会发现评价星级始终为红色，原因是对应的yaml文件中的配置，将服务流量全部切换为v3了；

    ```
    
    kubectl apply -f samples/bookinfo/networking/virtual-service-reviews-v3.yaml        

    yaml文件对应配置如下：
    
    - destination:
        host: reviews
        subset: v3
    ```

7. 通过以上验证，我们可以看到istio具备动态配置流量规则的能力，这种能力完全是代码无关，开发框架无关的。可以参考[Istio官方帮助](https://istio.io/docs/tasks/)继续试验更多Istio服务治理功能。

  [1]: https://docs.jdcloud.com/cn/jcs-for-kubernetes/create-to-cluster
  [2]: https://docs.jdcloud.com/cn/jcs-for-kubernetes/connect-to-cluster