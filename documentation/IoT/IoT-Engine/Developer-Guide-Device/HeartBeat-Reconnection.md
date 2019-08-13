# 心跳及重连

设备需要发送心跳到hub并得到回复确定网络的正常连接，如果有命令下发或者消息更新hub会推送到设备侧，设备需要读取对应的信息。

 ![心跳重连](../../../../image/IoT/IoT-DeviceSDK/Heartbeat.png)

## 维护网络连接和心跳

接口：

​	int iot_mqtt_yield(void *handle, int timeout_ms);

接口说明：检查网络状态，是否执行重连，发送心跳

返回值：iot_err_t中的code

参数说明：

| **参数名** | **参数类型**     | **必填** | **描述**   |
| ---------- | ---------------- | -------- | ---------- |
| handle     | iot_mc_client_pt | 是       | Mqt client |
| timeout_ms | int              | 是       | 循环周期   |

 

在mqtt client 中可通过设置connect_data.keepAliveInterval来调整心跳间隔，心跳间隔的取值范围（单位秒）CONFIG_MQTT_KEEPALIVE_INTERVAL_MIN  CONFIG_MQTT_KEEPALIVE_INTERVAL_MAX

 

## 检测网络状态

接口：

​	int iot_mqtt_check_state_normal(void *handle);

接口说明：检测网络连接是否正常

返回值：iot_err_t中的code

参数说明：

| **参数名** | **参数类型**     | **必填** | **描述**     |
| ---------- | ---------------- | -------- | ------------ |
| handle     | iot_mc_client_pt | 是       | Mqt   client |

示例代码：

```
Res = iot_mqtt_check_state_normal(handle);

If(Res){                       

// MQTT client in normal state

}else{

//MQTT client in abnormal state

}
```

