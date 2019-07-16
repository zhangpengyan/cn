# Nginx-ingress controller部署
Ingress 是从Kubernetes集群外部访问集群内部服务的入口，概念示意可参考下方说明。你可以给Ingress配置提供外部可访问的URL、负载均衡、SSL、基于名称的虚拟主机等。用户通过POST Ingress资源到API server的方式来请求ingress。 

  ```
   internet
        |
   [ Ingress ]
   --|-----|--
   [ Services ]
  ```
Ingress controller负责实现Ingress。Ingress controller在Kubernetes集群中默认不会自动启用，您可以在一个pod中部署任意类型的自定义Ingress Controller。本文将以Nginx-ingress controller为例，说明Controller部署和Ingress定义。更多外部类型的Ingresss Controller参考[Kubernetes官方文档](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)。

一、环境准备
1. 从github下载nginx-ingress controller最新的安装部署文件,并将部署文件解压缩到本地目录：

    ```
    
    wget https://github.com/nginxinc/kubernetes-ingress/archive/v1.4.5.tar.gz

    tar -zxvf v1.4.5.tar.gz
    ```

    **说明**：本文说明在1.12.3版本的集群上如何部署nginx-ingress controller，如集群版本不同，选择其他适合的ginx-ingress controller安装部署文件。
2. 进入解压缩后的nginx-ingress controller安装目录；

    `
    cd kubernetes-ingress-1.4.5/deployments
    `

二、安装nginx-ingress controller

1. 为nginx-ingress controller创建一个namespace和service account：

    `
    kubectl apply -f common/ns-and-sa.yaml
    `

2. 为NGINX默认Server配置TLS证书和key，并将TLS证书和key保存到secret中：

    `
    kubectl apply -f common/default-server-secret.yaml
    `

    **说明**：建议使用合适的TLS证书和key替换default-server-secret.yaml文件中自签发的证书和key。

3. 创建config map保存NGINX的自定义配置：

    `
    kubectl apply -f common/nginx-config.yaml
    `

    **说明**：目前提供的config map中的data为空，您可以按需添加自定义配置。
  
4. 为第1步中创建的service account配置RBAC：

    `
    kubectl apply -f rbac/rbac.yaml
    `

5. 以Deployment的方式部署nginx-ingress controller:

    `
    kubectl apply -f deployment/nginx-ingress.yaml
    `

6. 执行如下命令，确定部署nginx-ingress controller的Deployment运行正常：

    ```
    
    kubectl get deployment -n nginx-ingress

    NAME            DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
    nginx-ingress   1         1         1            1           24d
    ```
7. 在 Kubernetes集群中，每个Pod都具有唯一的内部 IP 地址，但是Deployment中的Pod随时可能被删除或创建，导致Pod IP地址不断变化。因此需要创建一个Service对外暴露Pod中的应用。Service具有唯一的固定IP地址且能够为后端添加的成员Pod提供负载均衡。在京东云Kubernetes集群中您可以使用LoadBalance类型的Service，为Service关联创建一个应用负载均衡，并通过负载均衡绑定的公网IP，将Service后端关联的nginx-ingress controller应用暴露到公网：

    ```
    
    apiVersion: v1
    kind: Service
    metadata:
      name: nginx-ingress       #建议Service使用与nginx-ingress controller对应的Deployment名称相同的名称
      namespace: nginx-ingress
    spec:
      type: LoadBalancer
      ports:
      - port: 80
        targetPort: 80
        protocol: TCP
        name: http
      - port: 443
        targetPort: 443
        protocol: TCP
        name: https
      selector:
        app: nginx-ingress
    ```
    **说明**：本例使用80和443端口绑定nginx-ingress controller应用

    将上述Service定义到Yaml文件，执行如下命令创建对应的Service：

    ```
    
    kubectl create -f X.yaml        # 请使用对应的Yaml文件名称替换X.yaml
    ```
8. 等待一段时间，确定Service已经配置完成，并获取Service上配置的External IP字段

    ```
    
    kubectl get svc -n nginx-ingress

    NAME            TYPE           CLUSTER-IP    EXTERNAL-IP    PORT(S)                      AGE
    nginx-ingress   LoadBalancer   10.X.XX.231   114.XX.XX.XX   80:30494/TCP,443:30467/TCP   24d

    说明：Service的External IP将作为nginx-ingress controller的VIP，为集群中使用nginx-ingress controller的Ingress提供公网访问入口
    ```
9. 最后，在Ingress controller的Deployment部署文件nginx-ingress.yaml中增加一对环境变量"-args -external-service=nginx-ingress",配置Ingress controller使用Service名称关联的External IP作为公网入口IP：

    ```
    
    args:
      - -nginx-configmaps=$(POD_NAMESPACE)/nginx-config
      - -default-server-tls-secret=$(POD_NAMESPACE)/default-server-secret
      - -external-service=nginx-ingress       #新增内容

    kubectl apply -f deployment/nginx-ingress.yaml        #重新部署nginx-ingress controller
    ```
10. 执行如下命令确定nginx-ingress controller相关的Pod运行正常，即可完成nginx ingress controller部署：

    ```
    
    kubectl get pod -n nginx-ingress

    输出结果：
    NAME                            READY   STATUS    RESTARTS   AGE
    nginx-ingress-6hz6b             1/1     Running   0          24d
    nginx-ingress-kbgbk             1/1     Running   0          24d
    nginx-ingress-nt68q             1/1     Running   0          24d
    ```

三、示例应用
1. 在集群中部署一个Deployment，运行一个Nginx webserver，返回pod主机名、IP地址、端口、请求URI和服务器本地时间，详情参考下方Yaml文件：

    ```
    
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: nginx-deployment
      labels:
        app: nginx
    spec:
      replicas: 3
      selector:
        matchLabels:
          app: nginx
      template:
        metadata:
          labels:
            app: nginx
        spec:
          containers:
          - name: nginx
            image: nginxdemos/hello:latest        #Nginx webserver容器镜像
            ports:
            - containerPort: 80
    ```
2. 执行如下命令,将上述Deployment部署到集群中：
    ```
    
    kubectl create -f X.yaml        # X.yaml请使用对应的Yaml文件名称替换

    kubectl get deployment nginx-deployment
    NAME               DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
    nginx-deployment   3         3         3            3           24d
    ```
3. 创建一个nodeport类型的service，将第1步中创建的deployment中部署的应用暴露出去：

    ```
    
    kubectl expose deployment nginx-deployment --target-port=80 --port=60000 --protocol=TCP --name=servicetest-jdcloud --type=NodePort
    
    kubectl get svc servicetest-jdcloud

    NAME                  TYPE       CLUSTER-IP    EXTERNAL-IP   PORT(S)
    servicetest-jdcloud   NodePort   10.0.57.193   <none>        60000:30770/TCP   23d
    ```
4. 创建一个ingress resouce，将第2步中创建的service作为ingress 的backend：

    ```
    
    apiVersion: extensions/v1beta1
    kind: Ingress
    metadata:
      name: k8s-app-monitor-agent-ingress
      annotations:
        metadata.annotations.kubernetes.io/ingress.class: "nginx"     #指定Ingress Resource创建时使用的Ingress Controller，本例使用上述创建的Nginx Controller
    spec:
      rules:
      - host: k8s-ingress-nginx-controller-test.jdcloud
        http:
          paths:
          - path: /
            backend:
              serviceName: servicetest-jdcloud
              servicePort: 60000
    ```

     
5. 执行如下命令，将上述ingress resource部署到集群中：

    ```

    kubectl create -f X.yaml        # X.yaml请使用对应的Yaml文件名称替换

    kubectl get ingress k8s-app-monitor-agent-ingress

    NAME                            HOSTS                                       ADDRESS   PORTS   AGE

    k8s-app-monitor-agent-ingress   k8s-ingress-nginx-controller-test.jdcloud             80      23d

    ```
    
6. 在本地服务器的/etc/hosts中增加DNS配置：IP为第二部分、第8项中创建的为nginx-ingress controller提供公网入口的LoadBalance类型service的external IP，域名为ingress resource rule中配置的虚拟主机名：k8s-ingress-nginx-controller-test.jdcloud；
7. 在浏览器中输入k8s-ingress-nginx-controller-test.jdcloud/servicetest-jdcloud即可查看输出结果，即可发现第1项中部署的nginx webserver已经暴露在集群外。


    


