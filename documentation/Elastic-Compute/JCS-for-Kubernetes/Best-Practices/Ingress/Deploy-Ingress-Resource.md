# 使用开源nginx-ingress controller定义ingress resource

Ingress 是从Kubernetes集群外部访问集群内部服务的入口。以HTTP/HTTPS route的方式将集群内的Service资源暴露到集群外部。

本文将以开源的nginx-ingress controller为例，说明在集群中定义HTTP、HTTPS类型的Ingress Resource的方法。

## 一、连接到集群

Kubernetes 命令行客户端 kubectl可以让您从客户端计算机连接到 Kubernetes 集群，实现应用部署。详情参考使用Kubectl客户端[连接到Kubernetes集群](https://docs.jdcloud.com/cn/jcs-for-kubernetes/connect-to-cluster)。

## 二、部署Ningx-ingress Controller
Nginx-ingress Controller是Nginx官方开源的ingress controller，部署方法参考[Nginx-ingress controller部署](https://docs.jdcloud.com/cn/jcs-for-kubernetes/deploy-ingress-nginx-controller)。

## 三、部署HTTP类型的Ingress Resource

1. 在集群中部署一个Deployment，运行一个Nginx webserver，返回pod主机名、IP地址、端口、请求URI和服务器本地时间，详情参考下方Yaml文件。

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
2. 下载YAML文件并执行如下命令,将上述Deployment部署到集群中，并确定deployment运行状态：

```
下载YAML文件：
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/ingress/deploy-nginx-server.yml

部署到集群：
kubectl create -f deploy-nginx-server.yml

确认deployment运行状态：
kubectl get deployment nginx-deployment
NAME               DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3         3         3            3           24s
```

3. 创建一个ClusterIP类型的service，将第1步中创建的deployment中部署的应用暴露出去，并确认Service及Endpoint状态：

```
创建Service：
kubectl expose deployment nginx-deployment --target-port=80 --port=60000 --protocol=TCP --name=servicetest-jdcloud

确认Service状态：
kubectl get service servicetest-jdcloud
NAME                  TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)     AGE
servicetest-jdcloud   ClusterIP   10.0.63.197   <none>        60000/TCP   46s

确认Endpoints状态：
kubectl get endpoints servicetest-jdcloud
NAME                  ENDPOINTS                              AGE
servicetest-jdcloud   10.0.0.19:80,10.0.0.6:80,10.0.0.8:80   88s

```

4. 创建一个Http类型的ingress resouce，将第3步中创建的service作为ingress 的backend，Yaml文件下载及说明如下：

* 下载Yaml文件：

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/ingress/deploy-http-ingress-resource.yml
`

* Yaml文件说明：

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

* 执行如下命令，将上述ingress resource部署到集群中：

`
kubectl create -f deploy-http-ingress-resource.yml 
`

* 确认Ingress Resource状态

```
kubectl get ingress k8s-app-monitor-agent-ingress

NAME                            HOSTS                                       ADDRESS   PORTS   AGE

k8s-app-monitor-agent-ingress   k8s-ingress-nginx-controller-test.jdcloud             80      23s
```

4. 在本地浏览器验证通过Ingress Resource Rule中配置的虚拟主机名访问后段服务：

* 获取Nginx-ingress Controller的外网IP，即Nginx-ingress Controller 关联的LoadBalancer类型Service的External IP，详情参考[Nginx-ingress controller部署](https://docs.jdcloud.com/cn/jcs-for-kubernetes/deploy-ingress-nginx-controller)。

* 在本地服务器的/etc/hosts中增加DNS配置：IP为上一步操作中查询到的LoadBalance类型service的external IP，域名为ingress resource rule中配置的虚拟主机名：k8s-ingress-nginx-controller-test.jdcloud；

* 在浏览器中输入k8s-ingress-nginx-controller-test.jdcloud/servicetest-jdcloud即可验证nginx webserver已经暴露在集群外。

## 四、部署HTTPS类型的Ingress Resource

### 第一步：CA证书和私钥

1. 您可以使用京东云提供的[SSL数字证书](https://docs.jdcloud.com/cn/ssl-certificate/product-overview)服务；

2. 您也可以自建CA或SSL，详情参考[自建CA证书和私钥](https://docs.jdcloud.com/cn/jcs-for-kubernetes/deploy-CA-SSL)；

3. 如果您已经有CA证书和私钥，可跳过此步骤，进入第二步。

### 第二步： 使用第一步中申请的SSL证书或其他自定义证书在Kubernetes集群中创建Secret资源

1. 创建TLS类型的Secret，执行如下命令：

```

kubectl create secret tls ingress-ssl-secret --cert web-server.pem --key web-server-key.pem			#cert和key的value值请使用实际申请的SSL证书和私钥名称替换
```

2. 查看Secret状态

```
kubectl describe secret/ingress-ssl-secret
Name:         ingress-ssl-secret
Namespace:    nginx-ingress
Labels:       <none>
Annotations:  <none>

Type:  kubernetes.io/tls

Data
====
tls.crt:  1448 bytes
tls.key:  1675 bytes
```

### 第三步： 创建HTTPS类型的Ingress Resource

1. HTTPS类型的Ingress Resource资源的YAML文件下载及说明如下：

* 下载Yaml文件

`
wget https://kubernetes.s3.cn-north-1.jdcloud-oss.com/ingress/deploy-https-ingress-resource.yml
`

* Yaml文件说明如下：

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  annotations:
	metadata.annotations.kubernetes.io/ingress.class: "nginx"     #指定Ingress Resource创建时使用的Ingress Controller，本例使用上述创建的Nginx Controller
  name: myingress
  namespace: nginx-ingress
spec:
  rules:
  - host: nginx-ingress-test.jdcloud
    http:
      paths:
      - backend:
          serviceName: servicetest-jdcloud
          servicePort: 60000
        path: /nginx-demo
  tls:
  - hosts:
    - nginx-ingress-test.jdcloud
    secretName: ingress-ssl-secret        #secretName请使用第二步中创建的TLS类型的Secret名称替换
```

2. 部署Ingress Resource，运行命令如下：

`
kubectl create -f deploy-https-ingress-resource.yml
`

3. 在本地浏览器验证通过Ingress Resource Rule中配置的虚拟主机名访问后段服务：

* 获取Nginx-ingress Controller的外网IP，即Nginx-ingress Controller 关联的LoadBalancer类型Service的External IP，详情参考[Nginx-ingress controller部署](https://docs.jdcloud.com/cn/jcs-for-kubernetes/deploy-ingress-nginx-controller)；

* 在本地服务器的/etc/hosts中增加DNS配置：IP为上一步操作中查询到的LoadBalance类型service的external IP，域名为ingress resource rule中配置的虚拟主机名：nginx-ingress-test.jdcloud；

* 在浏览器中输入nginx-ingress-test.jdcloud/nginx-demo即可验证输出结果。

**备注**： 使用自定义CA证书时，浏览器会提示证书不备信任，您可以将自建CA的ca.pem文件导入到操作系统并设置永久信任。