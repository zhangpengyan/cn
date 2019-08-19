# 辅助API

## 生成消息ID

设备每次发送消息都会生成msgid，hub响应时回传，用于判断消息对。
```
uint32_t iot_mqtt_generate_msgid();
```
接口说明：生成json中msgid，用于判断消息对
返回值：返回生成的msgid
参数说明：none

| **参数名** | **参数类型** | **必填** | **描述** |
| ---------- | ------------ | -------- | -------- |
| none       | none         |          | none     |

消息体中的公共数据格式：
```
{
"msgId ": 123
"version":1.0
"code": 200,
"message": "request parameter error",
"data": {}
}
```
  Msgid 用于判断上下行消息对
  Version 判断当前的协议版本
  Code   应用状态码 类型为iot_mqtt_reply_code_t;
  Message 用于错误信息描述

## 判断topic类型

当接受到下发消息后，可用此方法判断是否是service的topic
```
int32_t iot_mqtt_is_service_topic(const char *topic);
```
接口说明：判断此topic 是否为service topic
返回值：1 是service topic，0非service topic
参数说明：none

| **参数名** | **参数类型** | **必填** | **描述**    |
| ---------- | ------------ | -------- | ----------- |
| topic      | char*        | 是       | topic字符串 |

 

类似接口
```
int32_t iot_mqtt_is_event_topic(const char *topic);
int32_t iot_mqtt_is_shadow_get_reply_topic(const char *topic);
int32_t iot_mqtt_is_shadow_get_reply_topic(const char *topic)
int32_t iot_mqtt_is_shadow_get_reply_topic(const char *topic);
```
## 构建设备响应的JSON数据

接口：
```
cJSON * iot_mqtt_build_service_reply_json(cJSON * req, cJSON * service_data, int64_t ts, iot_mqtt_reply_code_t code, char *errMsg);
```
接口说明：构建回复云端下发的服务请求jison数据，用户只需要关心data中的更新值，其他字段如msgeid、timestamp、version等自动生成。
返回值：成功返回构建的cjosn对象，失败返回null
参数说明：

| **参数名**   | **参数类型**          | **必填** | **描述**             |
| ------------ | --------------------- | -------- | -------------------- |
| Req          | cJson*                | 是       | 服务端下发的json对象 |
| Service_data | cJson*                | 是       | Json中的data对象     |
| Ts           | Int64_t               | 是       | 时间戳               |
| Code         | iot_mqtt_reply_code_t | 是       | 状态码               |
| ErrMsg       | Char   *              | 是       | 错误信息描述         |

类似接口
```
cJSON * iot_mqtt_build_shadow_update_reply_json(cJSON * req, cJSON * current, int64_t ts, iot_mqtt_reply_code_t code, char *errMsg)
```
## 构建发送云端的JSON数据
接口：
```
cJSON * iot_mqtt_build_property_json(cJSON * data, int64_t ts)；
```
接口说明：设备进行属性上报时，可通过此方法生成请求的json数据。
返回值：成功返回构建的cjosn对象，失败返回null
参数说明：

| **参数名** | **参数类型** | **必填** | **描述**         |
| ---------- | ------------ | -------- | ---------------- |
| Data       | cJson*       | 是       | Json中的data对象 |
| Ts         | cJson*       | 是       | 时间戳           |

类似接口：
```
cJSON * iot_mqtt_build_shadow_acquiring_json(cJSON * data, int64_t ts)；
cJSON * iot_mqtt_build_device_shadow_update_json(cJSON * current, int64_t ts)；
```
## 注册回调

接口：
```
void (*iot_mqtt_event_handle_func_fpt)(void *pcontext, void *pclient, iot_mqtt_event_msg_pt msg);
```
实现该方法，在订阅时进行注册，和云端有数据交互时会进行调用。
返回值：void
参数说明：

| **参数名** | **参数类型**          | **必填** | **描述**               |
| ---------- | --------------------- | -------- | ---------------------- |
| Pcontext   | void*                 | 是       | 订阅时设备传入的返回值 |
| Pclient    | void*                 | 是       | Mqtt实例               |
| Msg        | iot_mqtt_event_msg_pt | 是       | 消息体                 |

 
