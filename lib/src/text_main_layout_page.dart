import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../flutter_tag_layout.dart';
import 'layout_painter.dart';

class TextLayoutMainPage extends StatefulWidget {
  List<TextLayoutModel> textLayoutModelList;
  EdgeInsets margins;
  EdgeInsets padding;

  Function(String value) tagClickCallback;

  TextLayoutMainPage(this.textLayoutModelList,
      {this.margins:
          const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
      this.padding =
          const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
      this.tagClickCallback});

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<TextLayoutMainPage> {
  @override
  Widget build(BuildContext context) {
    return buildBody3();
  }

  Widget buildBody3() {
    List<Widget> columnList = [];

    for (TextLayoutModel textModel in widget.textLayoutModelList) {
      ///显示文字的大小
      double fontSize = textModel.textSize;

      ///显示文字的颜色
      Color fontColor =
          (textModel.textColor == null || textModel.isTextColorRandom)
              ? getRandomColor()
              : textModel.textColor;

      ///背景颜色
      Color backgroundColor = textModel.textBackgroundColor;

      ///背景模式
      TextLayoutBackgroundModel backgroundModel = textModel.backgroundModel;

      ///文字前面的小圆点的颜色
      Color iconColor = textModel.iconColor ?? getRandomColor();

      ///背景的四个角的圆角
      double backGroundRadius = textModel.backGroundRadius;

      ///文字前面的小圆点的半径
      double radius = fontSize / 10 * 8;

      Widget cirPoint = Container();
      if (textModel.isShowCirPoint) {
        cirPoint = Container(
          margin: EdgeInsets.only(left: widget.margins.left),
          width: radius,
          height: radius,
          decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.all(Radius.circular(9)),
              boxShadow: [
                BoxShadow(
                    color: iconColor,
                    offset: Offset(radius / 10, radius / 4),
                    blurRadius: 0.2),
                BoxShadow(
                    color: iconColor,
                    offset: Offset(-radius / 10, radius / 4),
                    blurRadius: 0.2)
              ]),
        );
      }

      Row row = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///文字前的小图片
          textModel.imag ?? Container(),

          ///文字前的icon,
          textModel.icon ?? Container(),

          ///文字前的小圆点
          cirPoint,

          ///文字内容
          Container(
            margin: widget.margins,
            child: Text(
              textModel.text,
              style: TextStyle(fontSize: fontSize, color: fontColor),
            ),
          )
        ],
      );

      ///配置边框圆角
      switch (backgroundModel) {
        case TextLayoutBackgroundModel.rect:
        case TextLayoutBackgroundModel.rectBackgroundAndBorder:
        case TextLayoutBackgroundModel.rectBorder:
          backGroundRadius = 0;
          break;
        case TextLayoutBackgroundModel.rrect:
        case TextLayoutBackgroundModel.rrectBackgroundAndBorder:
        case TextLayoutBackgroundModel.rrectBorder:
          backGroundRadius = textModel.backGroundRadius;
          break;
        case TextLayoutBackgroundModel.oval:
        case TextLayoutBackgroundModel.ovalBackgroundAndBorder:
        case TextLayoutBackgroundModel.ovalBorder:
          backGroundRadius = (10 +
                  fontSize +
                  widget.padding.top +
                  widget.padding.bottom +
                  widget.margins.top +
                  widget.margins.bottom) /
              2;
          break;
        case TextLayoutBackgroundModel.none:
          backGroundRadius = 0;
          break;
      }
      Border border;
      switch (backgroundModel) {
        case TextLayoutBackgroundModel.rect:
        case TextLayoutBackgroundModel.rrect:
        case TextLayoutBackgroundModel.oval:
          border = null;
          break;

        case TextLayoutBackgroundModel.rectBorder:
        case TextLayoutBackgroundModel.rrectBorder:
        case TextLayoutBackgroundModel.ovalBorder:
          border = textModel.border ??
              new Border.all(color: backgroundColor, width: 0.5);
          backgroundColor = Colors.transparent;
          break;

        case TextLayoutBackgroundModel.rrectBackgroundAndBorder:
        case TextLayoutBackgroundModel.rectBackgroundAndBorder:
        case TextLayoutBackgroundModel.ovalBackgroundAndBorder:
          border = textModel.border ??
              new Border.all(color: backgroundColor, width: 0.5);
          break;
        case TextLayoutBackgroundModel.none:
          backgroundColor = Colors.transparent;
          backGroundRadius = 0;
          break;
      }

      Container container = Container(
        padding: widget.padding,
        child: row,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(backGroundRadius)),
          // 边框颜色与宽度
          border: border,
        ),
      );
      if (widget.tagClickCallback != null) {
        columnList.add(InkWell(
          onTap: () {
            widget.tagClickCallback(textModel.text);
          },
          child: container,
        ));
      } else {
        columnList.add(container);
      }
    }

    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      alignment: Alignment.center,
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: columnList,
        alignment: WrapAlignment.spaceEvenly,
      ),
    );
  }

  getRandomColor() {
    return Color.fromARGB(255, Random.secure().nextInt(255),
        Random.secure().nextInt(255), Random.secure().nextInt(255));
  }

  buildBody2() {
    Size size = context?.findRenderObject()?.paintBounds?.size;

    List<Widget> columnList = [];
    Row row1;
    for (TextLayoutModel textModel in widget.textLayoutModelList) {
      double fontSize = textModel.textSize;
      Color fontColor = textModel.textColor;
      Color backgroundColor = textModel.textBackgroundColor;
      TextLayoutBackgroundModel backgroundModel = textModel.backgroundModel;
      Row row = Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: widget.margins.left),
            width: fontSize / 10 * 8,
            height: fontSize / 10 * 8,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(color: fontColor, offset: Offset(2, 2)),
                  BoxShadow(color: fontColor, offset: Offset(-2, -2))
                ]),
          ),
          Container(
            margin: widget.margins,
            padding: widget.padding,
            child: Text(
              textModel.text,
              style: TextStyle(fontSize: fontSize, color: fontColor),
            ),
          )
        ],
      );

      double backGroundRadius = 0;

      if (backgroundModel == TextLayoutBackgroundModel.rect) {
        backGroundRadius = 0;
      } else if (backgroundModel == TextLayoutBackgroundModel.rrect) {
        backGroundRadius = 4;
      } else if (backgroundModel == TextLayoutBackgroundModel.oval) {
        backGroundRadius = 10;
      }

      Container container = Container(
        child: row,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(backGroundRadius)),
        ),
      );

      row1 = Row(
        children: [container],
      );

      columnList.add(row1);
    }

    return Scaffold(
      body: Column(
        children: columnList,
      ),
    );
  }
}
