# Golang连接
- step1：下载golang的redis客户端

<code>go get github.com/garyburd/redigo/redis</code>


- step2：编写测试用例

```
package main
 import (
     "fmt"
    "github.com/garyburd/redigo/redis"
)
func main() {
    host := "jredis-cn-north-1-prod-redis-xxxxxxxxxx.jdcloud.com"//控制台显示的地址
    port := 6379
    c, err := redis.Dial("tcp", fmt.Sprintf("%s:%d", host, port))
    if err != nil {
        fmt.Println("Connect to redis error", err)
        return
    }
    defer c.Close()
    _, err := c.Do("AUTH", "********")
    if err != nil {
        fmt.Println("redis auth failed: ", err)
        return
    }
    _, err := c.Do("SET", "key", "jcloud-redis")
    if err != nil {
        fmt.Println("redis set failed: ", err)
        return
    }
     _, err := c.Do("GET", "key")
    if err != nil {
        fmt.Println("redis get failed: ", err)
        return
    }
    //do other command...
}
```
