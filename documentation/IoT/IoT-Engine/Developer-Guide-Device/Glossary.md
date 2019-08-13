# 术语

| **名词**      | **说明**                                                     |
| ------------- | ------------------------------------------------------------ |
| ProductKey    | 产品的唯一标识                                               |
| ProductSecret | 产品的秘钥，用于用户设备一型一密的验证                       |
| DeviceName    | 一个设备的名称，通常为设备的mac地址、SN等                    |
| DeviceSecret  | 一个设备的秘钥，用于信息签名                                 |
| Identifier    | 一个设备的全局唯一标识，用于信息签名                         |
| 一型一密      | 设备通过其产品型号的ProductKey和ProductSecret动态获取Identifier和DeviceSecret进行验证连接 |
| 一机一密      | 设备通过ProductKey、Identifier、DeviceSecret进行验证连接     |
| 三元组        | 设备的ProductKey、Identifier、DeviceSecret称为三元组         |

