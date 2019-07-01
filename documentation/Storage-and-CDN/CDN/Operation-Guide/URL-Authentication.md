# URL鉴权说明

京东云CDN 支持参数鉴权，用户可以根据自己的业务情况，选择合适的鉴权方式，来实现对源站资源的有效保护。（目前直播支持参数鉴权和直播远程鉴权，点播页面下载支持参数鉴权和路径鉴权）

**1.参数鉴权方法**

**1.1**   **加密 URL 构成**

http://DomainName/Path/Filename?参数&auth_token=expire-uniqid-rand-signature

signature =md5sum("uri-expire-uniqid-rand-private_key")

**1.2**   **鉴权字段描述**

| **字段**    | **描述**                                                     |
| ----------- | ------------------------------------------------------------ |
| expire      | 失效时间，10位整型整数。                                     |
| uniqid      | 整型，随机数，唯一id，不使用时设置成0即可。该字段可以用来标记身份或业务，用户可自行设定 |
| rand        | 整型，随机数，一般设置成0。可以使用生成token时的时间戳作为rand |
| signature   | 字符串，通过md5算法计算出的验证串，数字和小写英文字母混合0-9a-z，固定长度32，不区分大小写。 |
| uri         | 是用户的请求对象相对地址，不包含参数。                       |
| private_key | 用户自定义的秘钥（8-32个字符）。                             |

**1.3**   **原理说明**

* CDN服务器拿到请求后，首先会判断请求中的 expire  是否小于当前时间，如果小于，则认为过期失效并返回HTTP 403错误。如果 expire 大于当前时间，则构造出一个同样的字符串(参考以下signature构造方式)。然后使用MD5算法算出 new_signature ，再和请求中带来的 signature  进行比对。比对结果一致，则认为鉴权通过，返回文件。否则鉴权失败，返回HTTP 403错误。

* new_signature  是通过以下字符串计算出来的：

**origin_signature** = **"uri-expire-uniqid-rand-private_key "**（uri是用户的请求对象相对地址，不包含参数）

**new_signature = md5sum(origin_ signature)**

**1.4**   **示例说明**

* 通过请求对象:

http://cdn.example.com/video/standard/1K.html?fa=121&jd=121

* 密钥设为：jdcloud1234 **(由用户自行设置)**

* 鉴权配置文件失效日期为：2020年06月18日00:00:00,计算出来的秒数为1592409600

* 则CDN服务器会构造一个用于计算signature的签名字符

/video/standard/1K.html-1592409600-0-0-jdcloud1234

* CDN服务器会根据该签名字符串计算signature:

**signature** = md5sum("/video/standard/1K.html-1592409600-0-0-jdcloud1234") =06d97bc9e43ded48d991994006cfa127

* 则请求时url为：

http://cdn.example.com/video/standard/1K.html ?fa=121&jd=121&auth_token=1592409600-0-0-06d97bc9e43ded48d991994006cfa127

计算出来的 **signature** 与用户请求中带的 **signature** =06d97bc9e43ded48d991994006cfa127值一致，于是鉴权通过。

**2.路径鉴权法**

**2.1**   **加密 URL 构成**

http://DomainName/deadline/ md5sum("uri-deadline-password")/Path/Filename?参数

**2.2**   **鉴权字段描述**

| **字段** | **描述**                                                     |
| -------- | ------------------------------------------------------------ |
| deadline | 失效时间，10位整型整数。                                     |
| uri      | 是用户的请求对象相对地址，不包含参数。                       |
| password | 用户自定义的秘钥（8-32个字符）                               |
| md5hash  | 通过md5算法计算出的验证串，数字和小写英文字母混合0-9a-z，固定长度32，不区分大小写。 |

**2.3**   **原理说明**

* CDN服务器拿到请求后，首先会判断请求中的 deadline 是否小于当前时间，如果小于，则认为过期失效并返回HTTP 403错误。如果 deadline大于当前时间，则构造出一个同样的字符串(参考以下sstring构造方式)。然后使用MD5算法算出 HashValue ，再和请求中带来的 md5hash 进行比对。比对结果一致，则认为鉴权通过，返回文件。否则鉴权失败，返回HTTP 403错误。

* HashValue 是通过以下字符串计算出来的：

sstring = "uri-deadline-Password" （uri是用户的请求对象相对地址，不包含参数）

HashValue = md5sum(sstring)

**2.4**   **示例说明**

* 通过请求对象:

http://cdn.example.com/video/standard/1K.html ?fa=121&cc=121

* 密钥设为：jcloud1234 **(由用户自行设置)**

* 鉴权配置文件失效日期为：2020年06月18日00:00:00,计算出来的秒数为1592409600

* 则CDN服务器会构造一个用于计算Hashvalue的签名字符

/video/standard/1K.html-1592409600-jcloud1234"

* CDN服务器会根据该签名字符串计算HashValue:

HashValue = md5sum("/video/standard/1K.html-1592409600-jcloud1234") = 8afb0900782e14c35214ccda534a3679

* 则请求时url为：

http://cdn.example.com/1592409600/8afb0900782e14c35214ccda534a3679/video/standard/1K.html? fa=121&cc=121

计算出来的HashValue与用户请求中带的 md5hash = 8afb0900782e14c35214ccda534a3679 值一致，于是鉴权通过。

**3.直播远程鉴权**

**3.1**   **请求参数说明**

domian***?vhost=vhostname&app=appname&stream=streamname&traceId=376ab86d8c647896&params=params

请求方式：GET

请求样例说明：

domain*** 表示推流远程鉴权接口地址，或者播放远程鉴权地址；推流远程鉴权地址和播放远程鉴权地址可以相同也可以不同，由客户方提供。

请求参数说明

| **参数名** | **类型**  | **描述** | **备注**  |
| -------- | -----------| -------- | -----------|
| vhost |string   | 推流域名，或者播放域名 | 推流远程鉴权时，表示推流域名；播放远程鉴权时，表示播放域名 | 
| app   | string  | 推流app，或者播放app  |  同上 | 
| stream | string  | 推流stream，或者播放stream | 同上  | 
| traceId | string |我方请求标识，唯一标识一次鉴权请求，客户方可忽略 | 同上   | 
| params  | string | url中获取 | params为推流或者播放url中携带的所有参数  | 

**3.2**   **返回参数说明**

| **参数名** | **描述**     |
| -------- | --------------|
| 1 | 鉴权成功     |
| 0 | 鉴权失败     |

返回样例：

成功

1

备注：只需要返回的value，以字符串形式返回即可。

**3.3**   **重试机制**

由于网络等原因造成的首次请求失败，会重试1次；重试后仍然失败，认为鉴权失败。

