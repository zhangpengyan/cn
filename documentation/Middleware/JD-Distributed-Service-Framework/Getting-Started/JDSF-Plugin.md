# JDSF 微服务平台插件说明

## spring cloud 插件说明

* 在您使用京东云微服务平台的时候如果您需要使用京东云微服务平台的`服务治理-服务鉴权`和`部署`功能则需要引用插件 `spring-cloud-jdsf` 系列插件，包括 `spring-cloud-jdsf-auth`和`spring-cloud-jdsf-consul`。按照您使用的 Spring Cloud 版本，来选择对应的插件。

&emsp;&emsp;如果您使用的springcloud版本为 `Edgware` 则需要引用：

```xml
    <dependency>
        <groupId>com.jdcloud.jdsf</groupId>
        <artifactId>spring-cloud-jdsf-auth</artifactId>
        <version>1.0-Edgware-SNAPSHOT</version>
    </dependency>
    <dependency>
        <groupId>com.jdcloud.jdsf</groupId>
        <artifactId>spring-cloud-jdsf-consul</artifactId>
        <version>1.0-Edgware-SNAPSHOT</version>
    </dependency>
```

&emsp;&emsp;如果使用的springcloud版本为 `Finchley` 版本则需要引用：

```xml
    <dependency>
        <groupId>com.jdcloud.jdsf</groupId>
        <artifactId>spring-cloud-jdsf-auth</artifactId>
        <version>1.0-Finchley-SNAPSHOT</version>
    </dependency>
    <dependency>
        <groupId>com.jdcloud.jdsf</groupId>
        <artifactId>spring-cloud-jdsf-consul</artifactId>
        <version>1.0-Finchley-SNAPSHOT</version>
    </dependency>
```

&emsp;&emsp;如果使用的为 `Greenwich` 版本则需要引用

```xml
    <dependency>
        <groupId>com.jdcloud.jdsf</groupId>
        <artifactId>spring-cloud-jdsf-auth</artifactId>
        <version>1.0-Greenwich-SNAPSHOT</version>
    </dependency>
    <dependency>
        <groupId>com.jdcloud.jdsf</groupId>
        <artifactId>spring-cloud-jdsf-consul</artifactId>
        <version>1.0-Greenwich-SNAPSHOT</version>
    </dependency>
```

&emsp;&emsp;引用后服务不需要进行任何配置，所有的认证配置只需要在控制台进行

* 如果您不想使用 JDSF 的服务治理功能，只想使用JDSF 的注册中心和部署功能，可以只配置注册中心的参数即可：  

```yaml
spring:
  cloud:
    consul:
      host: ${JDSF_CONSUL_HOST}
      port: ${JDSF_CONSUL_PORT}
```

* 如果您只想使用注册中心和部署又不想在配置文件中配置环境变量，推荐您引用我们的插件：
  
```xml
    <dependency>
        <groupId>com.jdcloud.jdsf</groupId>
        <artifactId>spring-cloud-jdsf-consul</artifactId>
        <version>${version}</version>
    </dependency>
```  

## 插件功能说明

* `spring-cloud-jdsf-consul` 插件会获取使用微服务平台部署功能部署时候的环境变量，从环境变量中自动查找注册中心地址，替换您配置文件中配置的地址，进行服务注册
