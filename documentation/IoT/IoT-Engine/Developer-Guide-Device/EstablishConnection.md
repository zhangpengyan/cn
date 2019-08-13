# 建立连接

## Host配置

京东云目前提供物联网引擎和物联网中心两个产品支持设备接入。

物联网引擎：在用户VPC内创建用户私有实例，所有资源为该用户独立使用。享有独立的接入入口。

物联网中心：用户无需创建实例，采用统一的接入入口，物联网中心为每个用户自动分配资源。

在SDK文件src/utils/iot_config.h 中，通过INDEPENDENT_MODE来控制SDK是访问物联网引擎还是物联网中心，物联网引擎需要将platform/linux/hal_os_linux.c 中_device_host的地址替换为公网域名地址。



## 初始化数据

SDK包含运行例子，里面有用于测试的证书、DeviceName、DeviceSecret等信息。填写在控制台获取的3件套后，即可初始参数调用iot_mqtt_construct()建立连接。

 ![设备连接](../../../../image/IoT/IoT-DeviceSDK/Connection1.png)

## 创建MQTT连接实例

接口：void *iot_mqtt_construct(iot_mqtt_param_t *pInitParams) 

接口说明：创建Mqtt 实例，初始化数据，建立mqtt连接

返回值：成功返回 mqtt实例，否则返回NULL

参数说明：

| **iot_mqtt_param_t****参数名** | **参数类型**            | **必填** | **描述**             |
| ------------------------------ | ----------------------- | -------- | -------------------- |
| port                           | char                    | 是       | Mqtt Broker端口      |
| *host                          | char                    | 是       | Mqtt Broker host     |
| client_id                      | char                    | 是       | Mqtt Client id       |
| username                       | char                    | 是       | Connectr name        |
| password                       | char                    | 是       | Connect pssword      |
| pub_key                        | char                    | 是       | Tls证书              |
| clean_session                  | uint8_t                 | 是       | 是否清楚mqtt会话     |
| request_timeout_ms             | uint32_t                | 是       | Mqtt连接的间隔       |
| write_buf_size                 | uint32_t                | 是       | size of write-buffer |
| read_buf_size                  | uint32_t                | 是       | size of read-buffer  |
| read_buf_size                  | iot_mqtt_event_handle_t | 是       | MQTT event handle    |

示例代码：

```
iot_mqtt_param_t       mqtt_params；

pclient = iot_mqtt_construct(&mqtt_params);
```



## 销毁MQTT连接和实例

接口： Int iot_mqtt_destroy (iot_mqtt_param_t *pInitParams)

接口说明：销毁Mqtt 实例，释放数据和连接

返回值：成功返回SUCCESS_RETURN，否则返回其他

参数说明：

| **iot_mqtt_param_t****参数名** | **参数类型**            | **必填** | **描述**             |
| ------------------------------ | ----------------------- | -------- | -------------------- |
| port                           | char                    | 是       | Mqtt Broker端口      |
| *host                          | char                    | 是       | Mqtt Broker host     |
| client_id                      | char                    | 是       | Mqtt Client id       |
| username                       | char                    | 是       | Connectr name        |
| password                       | char                    | 是       | Connect pssword      |
| pub_key                        | char                    | 是       | Tls证书              |
| clean_session                  | uint8_t                 | 是       | 是否清楚mqtt会话     |
| request_timeout_ms             | uint32_t                | 是       | Mqtt连接的间隔       |
| write_buf_size                 | uint32_t                | 是       | size of write-buffer |
| read_buf_size                  | uint32_t                | 是       | size of read-buffer  |
| read_buf_size                  | iot_mqtt_event_handle_t | 是       | MQTT event handle    |

 示例代码：

```
       iot_mqtt_destroy (pInitParams);
```

