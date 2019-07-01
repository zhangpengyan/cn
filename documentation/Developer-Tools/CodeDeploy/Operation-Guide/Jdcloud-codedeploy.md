## Jdcloud-codedeploy文件

在“新建部署”时，若“部署操作命令”选择“使用代码根目录的jdcloud-codedeploy.yml”，那么，云部署将执行jdcloud-codedeploy.yml的全部内容。这里需要注意的是，jdcloud-codedeploy.yml文件所在目录必须为代码根目录，文件名称为jdcloud-codedeploy.yml（大小写敏感）。

**模板**

```
files:
  - source: config/sql.txt
    destination: /home/config/sql
  - source: file1
    destination: /home/config
hooks:
   AfterInstall:
     - command: /opt/Control/Test1.sh
       timeout: 100
       runas: root
     - command: /opt/Control/Test2.sh
       timeout: 100
permissions: 
  - object: /home/config/soft
    pattern: "**"
    except: [function.php]
    owner: admin
    group: admin
    mode: 777
    type:
      - file
env:  
  php_path: /home/config/soft/php/bin
```

**关键字说明**

**1）files（必须）**

source：

- 支持文件和目录，若为文件，那么将复制（mv）指定文件；若为目录，那么将复制（mv）目录内的文件（不包括本目录）；若为一个单斜杠（/），则将复制（mv）所有文件。
- 相对路径：从代码包的根目录开始


destination：

- 复制（mv）source中的内容到此位置
- 绝对路径


支持多对source和destination。

**示例**

前提：在待部署程序包中，有如下文件：

```
file1.txt
file2.txt
folder1/file3.txt
```

下面将举例说明

示例1：

```
# files如下
- source: ./file1.txt
  destination: /home
# 执行结果如下：
/home/file1.txt
```

示例2：

```
# files如下
- source: ./file1.txt
  destination: /home
- source: ./file2.txt
  destination: /home  
# 执行结果如下：
/home/file1.txt
/home/file2.txt
```

示例3：

```
# files如下
- source: /
  destination: /home
# 执行结果如下：
/home/file1.txt
/home/file2.txt
/home/folder1/file3.txt
```

示例4：

```
# files如下
- source: ./folder1
  destination: /home/test01
# 执行结果如下：
/home/test01/file3.txt
```


**2）hooks（非必须）**

command：

- 命令或脚本的位置，为绝对路径
- 必须

timeout：

- 脚本的超时时间，单位为s
- 非必须，默认为10s

runas：

- 执行脚本的用户
- 非必须，默认为root


**工作流中的关键字对hooks的支持情况**

| 关键字      |   解释 | 是否支持hooks |
| :--------: | :--------:|:--------:|
| DownloadBundle  | 下载程序包 | 否 |
| BeforeBlockTraffic   | 取消负载均衡注册的前置脚本 | 是 |
| BlockTraffic  | 在负载均衡中取消注册 | 否 |
| AfterBlockTraffic | 取消负载均衡注册的后置脚本 | 是 |
| ApplicationStop | 停止脚本 | 是 |
| BeforeInstall | 部署前置脚本 | 是 |
| Install | 部署 | 否 |
| AfterInstall | 部署后置脚本 | 是 |
| ApplicationStart | 启动脚本 | 是 |
| ValidateService | 检查脚本 | 是 |
| BeforeAllowTraffic | 负载均衡注册的前置脚本 | 是 |
| AllowTraffic | 在负载均衡中注册 | 否 |
| AfterAllowTraffic | 负载均衡注册的后置脚本 | 是 |


在hooks的脚本中可支持如下环境变量：

| 环境变量      |   解释 |
| :--------: | :--------:|
|  JDCLOUD_CODEDEPLOY_APP_ID | 应用ID，可在部署应用页面查看 |
| JDCLOUD_CODEDEPLOY_APP_NAME | 应用名称，可在部署应用页面查看 |
| JDCLOUD_CODEDEPLOY_GROUP_ID | 部署组ID，可在应用详情页查看 |
| JDCLOUD_CODEDEPLOY_GROUP_NAME | 部署组名称，可在应用详情页查看 |
| JDCLOUD_CODEDEPLOY_DEPLOY_ID | 部署任务ID，可在部署历史页查看 |
| JDCLOUD_CODEDEPLOY_LIFECYCLE_EVENT | 工作流关键字 |


**示例**

```
hooks:
  AfterInstall:
    - command: /home/bin/stop.sh
      timeout: 100
      runas: hadoop
    - command: /home/bin/stop2.sh
      timeout: 100
      runas: root
  ApplicationStart:
    - command: /home/bin/start.sh
      timeout: 100
      runas: root
  BeforeInstall:
    - command: /home/bin/config.sh
      timeout: 10
```
将在部署过程中，将在工作流中的对应如下操作：

- 执行部署前置脚本：以root用户执行/home/bin/config.sh，超时时间为10s
- 执行启动脚本：以root用户执行/home/bin/start.sh，超时时间为100s
- 执行部署后置脚本：以hadoop用户执行/home/bin/stop.sh，超时时间为100s，接下来以root用户执行/home/bin/stop2.sh，超时时间为100s。两个command间由上至下顺序执行


建议在hooks脚本中，设置 set -e

**3）permissions（非必须）**

object: 

- 待修改权限的目录或文件
- 必须

pattern: 

- 若使用"**"，则权限将应用于所有匹配的目录或文件
- 非必须

except: 

- 例外的目录或文件
- 非必须

owner: 

- 指定目录或文件的属主
- 非必须

group: 

- 指定目录或文件的属组
- 非必须

mode: 

- 指定目录或文件的mode
- 非必须

type:

- 直接目录或文件。若为目录，那么权限将应用于object中除except外的所有目录（不包含object本身）；若为文件，那么权限将应用于object中除except外的所有文件（不包含object本身）。目录为directory，文件为file
- 非必须


**示例**

```
permissions:
  - object: /opt/soft
    pattern: "*bin*"
    except: [sbin/start]
    owner: admin
    mode: 777
    type:
      - directory
```

将在部署过程中，将在工作流中的对应如下操作：

在复制目录或文件到指定路径后，将执行permissions中对应操作：对于/opt/soft目录下，名字可匹配bin，且非sbin/start的目录，执行修改权限操作，权限修改为owner=admin，mode=777

**4）env（非必须）**

在工作流中执行hooks里的相关脚本时的环境变量

以 key: value 的方式，指明环境变量

**示例**

```
env:  
  php_path: /home/config/soft/php/bin

```





