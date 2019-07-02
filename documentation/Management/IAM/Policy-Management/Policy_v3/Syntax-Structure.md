# 语法结构

整个策略的语法结构如下图所示。

- 策略 policy 由版本 version 和语句 statement 构成。
- 语句 statement 是由若干个数组构成。每个数组包括操作（action）、资源 （resource）、生效条件 （condition） 以及权限（effect） 四个元素，其中 condition 是非必填项。
- 个块 block 的显示顺序无限制。例如，在策略中， version_block 可以跟在 effect_block 后面。

## JSON 格式

策略是定义一条或多条权限的 JSON 文档，撰写策略需要遵循 JSON 语法规范。

## 语法约定

语法描述中有如下约定：
以下字符是用于描述策略语法中的特殊字符，仅做本文档中策略语法说明使用，不允许包含在策略中：

```
  = < > ( ) | ...
```

元素后的问号 (?) 表示该元素是非必填项。例如：

```
<condition_block?>
```

元素是枚举值的情况下，枚举值之间用竖线 "|" 表示，并用 "()" 括号定义枚举值的范围。
例如：

```
("allow" | "deny")
```

字符串元素用双引号包括起来。
例如：

```
<version_block> = "version" : "3"
```

以下字符是包含在策略语法中的 JSON 字符：

```
{ } [ ] " , :
```

- 当一个元素允许多个值时，使用逗号分隔符进行表示。例如：

```
"resource":["resource_string", "resource_string”]  
"action":["action_string", "action_string”]  
"Principal":{<Principal_map>, <Principal_map>}
```

允许多个值时，也可以只包含一个值。当元素只有一个值时，下述两种表示方式是等效的。
例如：

```
"resource": ["resource_string"]     
"resource": "resource_string"
```

### 语法描述

```JSON
policy  = {
     <version_block>
     <principal_block?>,
     <statement_block>
}

<version_block> = "version" : "3"

<statement_block> = "statement" : [ <statement>, <statement>, ... ]

<statement> = {     
    <effect_block>,
    <action_block>,
    <resource_block>,
    <condition_block?>
}

<effect_block> = "effect" : ("allow" | "deny")  

<principal_block> = "principal": ("*" | <principal_map>)

<principal_map> = { <principal_map_entry>, <principal_map_entry>, ... }

<principal_map_entry> = "JDCloud":   
[<principal_id_string>, <principal_id_string>, ...]

<action_block> = "action": 
("*" | [<action_string>, <action_string>, ...])

<resource_block> = "resource": 
("*" | [<resource_string>, <resource_string>, ...])

<condition_block> = "condition" : { <condition_map> }

<condition_map> = 
{ 
  <condition_type_string> : { <condition_key_string> : <condition_value_list> },
  <condition_type_string> : { <condition_key_string> : <condition_value_list> }, ...
}  

<condition_value_list> = [<condition_value>, <condition_value>, ...]

<condition_value> = ("string" | "number" |"boolean")
```

> Condition的功能持续更新中，敬请期待
