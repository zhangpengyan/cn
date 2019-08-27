# 直播鉴权

## 推流鉴权说明

###  鉴权URL组成

鉴权URL由直播推流地址 + 验证串组成，验证串是根据鉴权 key + 失效时间通过 md5 算法计算出，该地址适用于 PC 端、移动端、第三方推流。
    
鉴权 KEY：用户在鉴权配置中填写的KEY参数。
    
有效时间：指用户访问客户源服务器时间超过自定义的时间（**timestamp** 字段指定）后，该鉴权失效，例如，有效时间为 1800s，用户设置访问时间：2020-08-15 15:00:00，链接真正失效时间是：2020-08-15 15:30:00。



### 用户访问加密 URL 构成

http://DomainName/Filename?auth_key=timestamp-rand-uid-md5hash


### 鉴权字段描述

|字段|描述|
|---|---|
|**timestamp**|失效时间，整形正数，固定长度 10，1970 年 1 月 1 日以来的秒数。用来控制失效时间，10 位整数，有效时间 1800s|
|**rand**|随机数，一般设成 0|
|**uid**|暂未使用（设置成 0 即可)|
|**md5hash**|通过 md5 算法计算出的验证串，数字和小写英文字母混合 0-9a-z，固定长度 32|

### 验证方法

服务器拿到请求后，首先会判断请求中的 timestamp 是否小于当前时间，如果小于，则认为过期失效并返回 HTTP 403 错误，如果 timestamp 大于当前时间，则构造出一个同样的字符串（参考以下 sstring 构造方式）。然后使用MD5算法算出 HashValue，再和请求中带来的 md5hash 进行比对，比对结果一致，则认为鉴权通过，返回文件，否则鉴权失败，返回 HTTP 403 错误


### 示例说明

1、通过 req_auth 请求对象:
http://cdn.example.com/sports/football

2、密钥设为：
jdlivekeyexample123 (由用户自行设置)

3、鉴权配置文件失效日期为：
2015年10月10日00:00:00，计算出来的秒数为 1444435200

4、服务器会构造一个用于计算 Hashvalue 的签名字符串：
/publishDomain/sports/football-1444435200-0-0-jdlivekeyexample123

5、服务器会根据该签名字符串计算 HashValue
HashValue=md5sum("/publishDomain /sports/football-1444435200-0-0-jdlivekeyexample123")
=80cd3862d699b7118eed99103f2a3a4f

6、请求时 url 为：
http:// cdn.example.com/sports/football?auth_key=1444435200-0-0-80cd3862d699b7118eed99103f2a3a4f
计算出来的 HashValue 与用户请求中带的 md5hash = 80cd3862d699b7118eed99103f2a3a4f 值一致，于是鉴权通过。
