
**题记**
  ——  执剑天涯，从你的点滴积累开始，所及之处，必精益求精，即是折腾每一天。
  
**重要消息**

* [网易云【玩转大前端】配套课程](https://study.163.com/instructor/1021406098.htm)
* [EDU配套  教程](https://edu.csdn.net/lecturer/1555)

* [Flutter开发的点滴积累系列文章](https://blog.csdn.net/zl18603543572/article/details/93532582)

***

#### 1  添加依赖

```java
flutter_tag_layout: ^0.0.3
```

#### 2 导包
在使用到文本标签的地方
```java
import 'package:flutter_tag_layout/flutter_tag_layout.dart';
```

#### 3 标签创建文本

```java
class TextTagPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<TextTagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("文本标签"),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Row(children: [
            TextTagWidget("文本标签"),
            TextTagWidget("测试"),
          ]),
        ));
  }
}

```
运行效果如下：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200626111950970.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3psMTg2MDM1NDM1NzI=,size_16,color_FFFFFF,t_70)
#### 4 结合流式布局使用

```java

class TextWarpTagPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<TextWarpTagPage> {
  
  ///文本标签集合
  List<String> tagList = ["文本标签", "测试", "这是什么", "早上好","吃饭", "再来一次"];

  @override
  Widget build(BuildContext context) {
    List<Widget> itemWidgetList = [];

    for (var i = 0; i < tagList.length; i++) {
      var str = tagList[i];
      itemWidgetList.add(TextTagWidget("$str"));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("文本标签"),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30.0, left: 10, right: 10),

          ///流式布局
          child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,

              ///子标签
              children: itemWidgetList),
        ));
  }
}

```

运行效果如下：
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020062611251621.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3psMTg2MDM1NDM1NzI=,size_16,color_FFFFFF,t_70)


**** 

完毕
![公众号 我的大前端生涯](https://img-blog.csdnimg.cn/20200620175409480.gif)