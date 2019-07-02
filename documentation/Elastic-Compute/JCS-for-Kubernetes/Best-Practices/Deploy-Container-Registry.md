# 集成容器镜像仓库  

关于使用容器镜像仓库的方法，请参考[容器镜像仓库帮助文档](https://docs.jdcloud.com/cn/container-registry/create-image)。  
例：注册表为myregistry，镜像仓库为myrepo，镜像版本号为latest，地域选择华北-北京为cn-north-1。用户可根据具体情况修改。

**对于一次性使用，临时令牌有效期内有效，有一定时效性**  
该方案只能实现某个注册表下的所有容器镜像的获取权限。  
1、获取临时令牌，Docker客户端登录命令中，-p后面的一串字符串为docker-password的内容：  
例：Docker客户端登录命令：docker login -u jdcloud -p cWj36rigll1J2k8u 1227-cn-north-1.jcr.service.jdcloud.com。即cWj36rigll1J2k8u为docker-password内容。  
2、创建命名为my-secret的secret，执行以下命令，相关内容需要根据情况进行修改：  
```
kubectl create secret docker-registry my-secret --docker-server=myregistry-cn-north-1.jcr.service.jdcloud.com --docker-username=jdcloud --docker-password=cWj36rigll1J2k8u --docker-email=l****@jd.com
```  
3、创建资源的时候，imagePullSecrets使用my-secret:  
例
```
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  labels:
    run: nginx
  name: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      run: nginx
  template:
    metadata:
      labels:
        run: nginx
    spec:
      containers:
      - image: myregistry-cn-north-1.jcr.service.jdcloud.com/myrepo:latest
        imagePullPolicy: Always
        name: nginx
      imagePullSecrets:
      - name: my-secret
```  

**对于长期使用，自动获取容器镜像仓库登录权限**  
该方案可以实现对该账户下所有注册表的容器镜像的获取权限。  
1、把用户的Access Key和Access Key Secret进行base 64位编码：  
`
printf  22BC1***********02C8C  | base64   #22BC1***********02C8C为Access Key、Access Key Secret
`  
输出内容即为Access Key和Access Key Secret进行base 64位编码：   
2、创建secret.yaml文件：  
`
vi secret.yaml
`  
内容如下：
```
apiVersion: v1
kind: Secret
metadata: 
  name: c-tokens-fresher-secret
  
type: Opaque
data: 
  ak: NE*******************xQjk= #需要修改成用户Access Key的base64位编码
  sk: RU*******************4QTE= #需要修改成用户的Access Key Secret的base64编码
```
3、创建cronjod.yaml文件:  
`
vi cronjob.yaml
`  
内容如下：
```
apiVersion: batch/v1
kind: Job
metadata:
  name: init-jcr-token-refresher
spec:
  template:
    metadata:
      name: init-jcr-token-refresher
    spec:
      serviceAccountName: jcr-credential
      restartPolicy: Never
      hostNetwork: true
      containers:
      - name: init-jcr-token-refresher
        env:
        - name: ACCESS_KEY
          valueFrom:
            secretKeyRef:
              name: c-tokens-fresher-secret
              key: ak
        - name: SECRET_KEY
          valueFrom:
            secretKeyRef:
              name: c-tokens-fresher-secret
              key: sk
        imagePullPolicy: Always
        image: jdcloudiaas/jcrtoken:cronjob
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: jcr-credential
  namespace: default
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: jcr-credential-rbac
subjects:
  - kind: ServiceAccount
    name: jcr-credential
    namespace: default
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
---
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: jdcloud-jcr-credential-cron
spec:
  schedule: "*/5 * * * *"
  successfulJobsHistoryLimit: 2
  failedJobsHistoryLimit: 2
  jobTemplate:
    spec:
      backoffLimit: 4
      template:
        spec:
          serviceAccountName: jcr-credential
          terminationGracePeriodSeconds: 0
          restartPolicy: Never
          hostNetwork: true
          containers:
          - name: jcr-token-refresher
            env:
            - name: ACCESS_KEY
              valueFrom:
                secretKeyRef:
                  name: c-tokens-fresher-secret
                  key: ak
            - name: SECRET_KEY
              valueFrom:
                secretKeyRef:
                  name: c-tokens-fresher-secret
                  key: sk
            imagePullPolicy: Always
            image: jdcloudiaas/jcrtoken:cronjob
```  
4、执行以下命令，运行：
```
kubectl create -f secret.yaml
kubectl create -f cronjob.yaml
```
5、创建资源时，image选取使用ak和sk用户下的镜像，imagePullSecrets使用jcr-pull-secret：  
例：
```
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  labels:
    run: nginx
  name: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      run: nginx
  template:
    metadata:
      labels:
        run: nginx
    spec:
      containers:
      - image: myregistry-cn-north-1.jcr.service.jdcloud.com/myrepo:latest
        imagePullPolicy: Always
        name: nginx
      imagePullSecrets:
      - name: jcr-pull-secret
```
