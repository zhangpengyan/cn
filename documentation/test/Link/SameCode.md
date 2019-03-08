# 代码渲染：
当前测试 
### JavaScript
```JavaScript
function k(a) {
        var b = v.map
          , c = a;
        if (b)
            for (var d = 0, e = b.length; e > d; d++) {
                var f = b[d];
                if (c = z(f) ? f(a) || a : a.replace(f[0], f[1]),
                c !== a)
                    break
            }
        return c
    }
    function l(a, b) {
        var c, d = a.charAt(0);
        if (J.test(a))
            c = a;
        else if ("." === d)
            c = f((b ? e(b) : v.cwd) + a);
        else if ("/" === d) {
            var g = v.cwd.match(K);
            c = g ? g[0] + a.substring(1) : a
        } else
            c = v.base + a;
        return 0 === c.indexOf("//") && (c = ("https:" == location.protocol ? "https:" : "http:") + c),
        c
    }
```

### C#
```C#
using System;
namespace HelloWorldApplication
{
    /* 类名为 HelloWorld */
    class HelloWorld
    {
        /* main函数 */
        static void Main(string[] args)
        {
            /* 我的第一个 C# 程序 */
            Console.WriteLine("Hello World!");
            Console.ReadKey();
        }
    }
}
```
### C
```C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
int main()
{
   char name[100];
   char *description;
 
   strcpy(name, "Zara Ali");
 
   /* 动态分配内存 */
   description = (char *)malloc( 200 * sizeof(char) );
   if( description == NULL )
   {
      fprintf(stderr, "Error - unable to allocate required memory\n");
   }
   else
   {
      strcpy( description, "Zara ali a DPS student in class 10th");
   }
   printf("Name = %s\n", name );
   printf("Description: %s\n", description );
}
```

### Scala
```Scala
import java.io._

object Test {
   def main(args: Array[String]) {
      val writer = new PrintWriter(new File("test.txt" ))

      writer.write("菜鸟教程")
      writer.close()
   }
}

```


### PHP
```PHP
<?php
// 定义变量并默认设为空值
$nameErr = $emailErr = $genderErr = $websiteErr = "";
$name = $email = $gender = $comment = $website = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  if (empty($_POST["name"])) {
    $nameErr = "名字是必需的。";
  } else {
    $name = test_input($_POST["name"]);
  }

  if (empty($_POST["email"])) {
    $emailErr = "邮箱是必需的。";
  } else {
    $email = test_input($_POST["email"]);
  }

  if (empty($_POST["website"])) {
    $website = "";
  } else {
    $website = test_input($_POST["website"]);
  }

  if (empty($_POST["comment"])) {
    $comment = "";
  } else {
    $comment = test_input($_POST["comment"]);
  }

  if (empty($_POST["gender"])) {
    $genderErr = "性别是必需的。";
  } else {
    $gender = test_input($_POST["gender"]);
  }
}
?>
```

### C++
```C++
#include <iostream>
 
using namespace std;
 
class Box
{
   public:
      double length;   // 长度
      double breadth;  // 宽度
      double height;   // 高度
};
 
int main( )
{
   Box Box1;        // 声明 Box1，类型为 Box
   Box Box2;        // 声明 Box2，类型为 Box
   double volume = 0.0;     // 用于存储体积
 
   // box 1 详述
   Box1.height = 5.0; 
   Box1.length = 6.0; 
   Box1.breadth = 7.0;
 
   // box 2 详述
   Box2.height = 10.0;
   Box2.length = 12.0;
   Box2.breadth = 13.0;
 
   // box 1 的体积
   volume = Box1.height * Box1.length * Box1.breadth;
   cout << "Box1 的体积：" << volume <<endl;
 
   // box 2 的体积
   volume = Box2.height * Box2.length * Box2.breadth;
   cout << "Box2 的体积：" << volume <<endl;
   return 0;
}
```

### Go
```Go
package main

import "fmt"

func main() {
   const LENGTH int = 10
   const WIDTH int = 5   
   var area int
   const a, b, c = 1, false, "str" //多重赋值

   area = LENGTH * WIDTH
   fmt.Printf("面积为 : %d", area)
   println()
   println(a, b, c)   
}
```

### HTTP
```HTTP
GET /linhaifeng/p/7278389.html HTTP/1.1
Host: www.cnblogs.com
Connection: keep-alive
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8
Accept-Encoding: gzip, deflate
Accept-Language: zh-CN,zh;q=0.9
```

### Swift

```Swift
import Cocoa

// 使用字符串字面量创建空字符串
var stringA = ""

if stringA.isEmpty {
   print( "stringA 是空的" )
} else {
   print( "stringA 不是空的" )
}

// 实例化 String 类来创建空字符串
let stringB = String()

if stringB.isEmpty {
   print( "stringB 是空的" )
} else {
   print( "stringB 不是空的" )
}
```

### Object-C
```Object-C
#import "Forwarder.h"

@implementation Forwarder

@synthesize recipient;

- (retval_t) forward: (SEL) sel : (arglist_t) args
{
    /*
     *检查转发对象是否响应该消息。
     *若转发对象不响应该消息，则不会转发，而产生一个错误。
     */
    if([recipient respondsTo:sel])
       return [recipient performv: sel : args];
    else
       return [self error:"Recipient does not respond"];
}
```

### MongoDB
```MongoDB
>db.col.find({"likes": {$gt:50}, $or: [{"by": "菜鸟教程"},{"title": "MongoDB 教程"}]}).pretty()
{
        "_id" : ObjectId("56063f17ade2f21f36b03133"),
        "title" : "MongoDB 教程",
        "description" : "MongoDB 是一个 Nosql 数据库",
        "by" : "菜鸟教程",
        "url" : "http://www.runoob.com",
        "tags" : [
                "mongodb",
                "database",
                "NoSQL"
        ],
        "likes" : 100
}
```
### Ruby
```Ruby
#!/usr/bin/ruby
 
require 'cgi'
require 'cgi/session'
cgi = CGI.new("html4")
 
sess = CGI::Session.new( cgi, "session_key" => "a_test",
                              "prefix" => "rubysess.")
lastaccess = sess["lastaccess"].to_s
sess["lastaccess"] = Time.now
if cgi['bgcolor'][0] =~ /[a-z]/
  sess["bgcolor"] = cgi['bgcolor']
end
 
cgi.out{
  cgi.html {
    cgi.body ("bgcolor" => sess["bgcolor"]){
      "The background of this page"    +
      "changes based on the 'bgcolor'" +
      "each user has in session."      +
      "Last access time: #{lastaccess}"
    }
  }
}
```
### Rust
```Rust
extern {
    fn log(__x : f64) -> f64;
    fn pow(__x : f64, __y : f64) -> f64;
    fn printf(__format : *const u8, ...) -> i32;
    fn rand() -> i32;
    fn sqrt(__x : f64) -> f64;
}
 
#[no_mangle]
pub unsafe extern fn randn(mut mu : f64, mut sigma : f64) -> f64 {
    let mut U1 : f64;
    let mut U2 : f64;
    let mut W : f64;
    let mut mult : f64;
    static mut X1 : f64 = 0f64;
    static mut X2 : f64 = 0f64;
    static mut call : i32 = 0i32;
    if call == 1i32 {
        call = (call == 0) as (i32);
        return mu + sigma * X2 as (f64);
    }
    loop {
        {
            U1 = -1i32 as (f64) + rand(
                                  ) as (f64) / 2147483647i32 as (f64) * 2i32 as (f64);
            U2 = -1i32 as (f64) + rand(
                                  ) as (f64) / 2147483647i32 as (f64) * 2i32 as (f64);
            W = pow(U1,2i32 as (f64)) + pow(U2,2i32 as (f64));
        }
        if !(W >= 1i32 as (f64) || W == 0i32 as (f64)) {
            break;
        }
    }
    mult = sqrt(-2i32 as (f64) * log(W) / W);
    X1 = U1 * mult;
    X2 = U2 * mult;
    call = (call == 0) as (i32);
    mu + sigma * X1 as (f64)
}
 
fn main() {
    let ret = unsafe { _c_main() };
    std::process::exit(ret);
}
 
#[no_mangle]
pub unsafe extern fn _c_main() -> i32 {
    printf(b"%f\n\0".as_ptr(),randn(0i32 as (f64),1i32 as (f64)));
    printf(b"%f\n\0".as_ptr(),randn(3i32 as (f64),2.5f64));
    0i32
}
```
### yaml
```YAML
---
# Collection Types 
# http://yaml.org/type/map.html -----------------------------------------------#

map:
  # Unordered set of key: value pairs.
  Block style: !!map
    Clark : Evans
    Ingy  : döt Net
    Oren  : Ben-Kiki
  Flow style: !!map { Clark: Evans, Ingy: döt Net, Oren: Ben-Kiki }

# http://yaml.org/type/omap.html ----------------------------------------------#

omap:
  # Explicitly typed ordered map (dictionary).
  Bestiary: !!omap
    - aardvark: African pig-like ant eater. Ugly.
    - anteater: South-American ant eater. Two species.
    - anaconda: South-American constrictor snake. Scaly.
    # Etc.
  # Flow style
  Numbers: !!omap [ one: 1, two: 2, three : 3 ]

# http://yaml.org/type/pairs.html ---------------------------------------------#

pairs:
  # Explicitly typed pairs.
  Block tasks: !!pairs
    - meeting: with team.
    - meeting: with boss.
    - break: lunch.
    - meeting: with client.
  Flow tasks: !!pairs [ meeting: with team, meeting: with boss ]
```

### Python:
```Python
# 快排的主函数，传入参数为一个列表，左右两端的下标-=
def QuickSort(list, low, high):
    if high > low:
        # 传入参数，通过Partitions函数，获取k下标值
        k = Partitions(list, low, high)
        # 递归排序列表k下标左侧的列表
        QuickSort(list, low, k - 1)
        # 递归排序列表k下标右侧的列表
        QuickSort(list, k + 1, high)


def Partitions(list, low, high):
    left = low
    right = high
    # 将最左侧的值赋值给参考值k
    k = list[low]
    # 当left下标，小于right下标的情况下，此时判断二者移动是否相交，若未相交，则一直循环
    while left < right:
        # 当left对应的值小于k参考值，就一直向右移动
        while list[left] <= k:
            left += 1
        # 当right对应的值大于k参考值，就一直向左移动
        while list[right] > k:
            right = right - 1
        # 若移动完，二者仍未相遇则交换下标对应的值
        if left < right:
            list[left], list[right] = list[right], list[left]
    # 若移动完，已经相遇，则交换right对应的值和参考值
    list[low] = list[right]
    list[right] = k
    # 返回k值
    return right


list_demo = [6, 1, 2, 7, 9, 3, 4, 5, 10, 8]
# print(list_demo)
QuickSort(list_demo, 0, 9)
print(list_demo)
```

### Java:
```Java
public static BufferedImage toBufferedImage(Image image) {
    if (image instanceof BufferedImage) {
        return (BufferedImage) image;
    }
    // This code ensures that all the pixels in the image are loaded
    image = new ImageIcon(image).getImage();
    BufferedImage bimage = null;
    GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
    try {
        int transparency = Transparency.OPAQUE;
        GraphicsDevice gs = ge.getDefaultScreenDevice();
        GraphicsConfiguration gc = gs.getDefaultConfiguration();
        bimage = gc.createCompatibleImage(image.getWidth(null), image.getHeight(null), transparency);
    } catch (HeadlessException e) {
        // The system does not have a screen
    }
    if (bimage == null) {
        // Create a buffered image using the default color model
        int type = BufferedImage.TYPE_INT_RGB;
        bimage = new BufferedImage(image.getWidth(null), image.getHeight(null), type);
    }
    // Copy image to buffered image
    Graphics g = bimage.createGraphics();
    // Paint the image onto the buffered image
    g.drawImage(image, 0, 0, null);
    g.dispose();
    return bimage;
}


public static byte[] File2byte(String filePath) {
    byte[] buffer = null;
    try {
        File file = new File(filePath);
        FileInputStream fis = new FileInputStream(file);
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        byte[] b = new byte[1024];
        int n;
        while ((n = fis.read(b)) != -1) {
            bos.write(b, 0, n);
        }
        fis.close();
        bos.close();
        buffer = bos.toByteArray();
    } catch (FileNotFoundException e) {
        e.printStackTrace();
    } catch (IOException e) {
        e.printStackTrace();
    }
    return buffer;
}
```

### JSON：
```JSON
{
   "min_position": "int(3,4,5-9)",
   "has_more_items": "bool",
   "items_html": "string('Bus','Car','Bike')",
   "new_latent_count": "int",
   "data": {
      "length": "int(20-30)",
      "text": "string"
   },
   "numericalArray": [
      "repeat[5]",
      "int(20,23-33)"
   ],
   "StringArray": [
      "repeat[4]",
      "string('Carbon','Nitrogen','Oxygen')"
   ],
   "multipleTypesArray": [3,"Hello",5,true],
   "objArray": [
      "repeat[5]",
      {
         "class": "string('middle','upper','lower')",
         "age": "int"
      }
   ]
}
```

### SQL：
```SQL
SELECT   
   soh.OrderDate AS [Date],   
   soh.SalesOrderNumber AS [Order],   
   pps.Name AS Subcat, pp.Name as Product,    
   SUM(sd.OrderQty) AS Qty,  
   SUM(sd.LineTotal) AS LineTotal  
FROM Sales.SalesPerson sp   
   INNER JOIN Sales.SalesOrderHeader AS soh   
      ON sp.BusinessEntityID = soh.SalesPersonID  
   INNER JOIN Sales.SalesOrderDetail AS sd   
      ON sd.SalesOrderID = soh.SalesOrderID  
   INNER JOIN Production.Product AS pp   
      ON sd.ProductID = pp.ProductID  
   INNER JOIN Production.ProductSubcategory AS pps   
      ON pp.ProductSubcategoryID = pps.ProductSubcategoryID  
   INNER JOIN Production.ProductCategory AS ppc   
      ON ppc.ProductCategoryID = pps.ProductCategoryID  
GROUP BY ppc.Name, soh.OrderDate, soh.SalesOrderNumber, pps.Name, pp.Name,   
   soh.SalesPersonID  
HAVING ppc.Name = 'Clothing'
```


### Linux 语句
```Linux
[root@localhost ~]#name=dangxu    //定义一般变量 
[root@localhost ~]# echo ${name} 
dangxu 
[root@localhost ~]# cat test.sh   //验证脚本，实例化标题中的./*.sh 
#!/bin/sh 
echo ${name} 
[root@localhost ~]# ls -l test.sh  //验证脚本可执行 
-rwxr-xr-x 1 root root 23 Feb 6 11:09 test.sh 
[root@localhost ~]# ./test.sh    //以下三个命令证明了结论一 
[root@localhost ~]# sh ./test.sh 
[root@localhost ~]# bash ./test.sh 
[root@localhost ~]# . ./test.sh   //以下两个命令证明了结论二 
dangxu 
[root@localhost ~]# source ./test.sh 
dangxu 
[root@localhost ~]# 
```


### Linux 语句
```Linux
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```

### SHELL SHEHLL采用SHELL渲染
```Shell
#!/usr/bin/env bash
mkdir code
cd  code
for ((i=0; i<3; i++)); do
    touch test_${i}.txt
    echo "shell很简单" >> test_${i}.txt
done

```

### bash SHELL采用BASH渲染 
```bash
#!/usr/bin/env bash
mkdir code
cd  code
for ((i=0; i<3; i++)); do
    touch test_${i}.txt
    echo "shell很简单" >> test_${i}.txt
done

```


### XML:
```XML
<?xml version="1.0" encoding="UTF-8" ?>
<!---Students grades are uploaded by months---->
<class_list>
    <student>
        <name>Tanmay</name>
        <grade>A</grade>
    </student>
</class_list>
```

### HTML:
```HTML
<h3>
    <a id="user-content-xml" class="anchor" href="#xml" aria-hidden="true">
        <span aria-hidden="true" class="octicon octicon-link">
        我是一个测试的数据
        </span>
    </a>
    XML
</h3>
```
