import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_utils.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/26.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class TextTagWidget extends StatefulWidget {
  ///显示的文本
  String text;
  EdgeInsets margin;
  EdgeInsets padding;

  TextStyle textStyle;

  Color backgroundColor;
  Color borderColor;

  double borderRadius;

  TextTagWidget(this.text,
      {this.margin = const EdgeInsets.all(4),
      this.padding = const EdgeInsets.only(left: 6,right: 6,top: 3,bottom: 3),
      this.textStyle,
      this.backgroundColor,
      this.borderColor,
      this.borderRadius = 20.0}) {
    if (this.borderColor == null) {
      if (this.backgroundColor != null) {
        this.borderColor = this.backgroundColor;
      } else {
        this.borderColor = getRandomColor();
      }
    }

    if (this.textStyle == null) {
      Color textColor = this.borderColor;
      if (backgroundColor != null) {
        textColor = Colors.white;
      }
      this.textStyle = TextStyle(fontSize: 12, color: textColor);
    }

    if (this.backgroundColor == null) {
      this.backgroundColor = Colors.transparent;
    }
  }

  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<TextTagWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
          border: Border.all(color: widget.borderColor)),
      child: buildTextWidget(),
    );
  }

  ///构建文本
  Text buildTextWidget() {
    return Text(
      widget.text,
      style: widget.textStyle,
      textAlign: TextAlign.center,
    );
  }
}
