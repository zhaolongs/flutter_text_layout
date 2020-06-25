

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextLayoutModel{
  ///文字内容
  String text;
  ///文字颜色
  Color textColor;
  ///文字颜色是否随机
  ///在配置为true或者是textColor为null时生效
  bool isTextColorRandom;
  ///是否显示文字前小圆点
  bool isShowCirPoint;
  ///背景颜色
  Color textBackgroundColor;
  ///文字前的小圆点颜色
  Color iconColor;
  ///字体大小
  double textSize;
  ///背景的模式
  TextLayoutBackgroundModel backgroundModel;
  ///边框的圆角
  double backGroundRadius;
  ///指定单独的边框
  Border border;
  ///文字前的小图片
  Image imag;
  ///文字前的小图标
  Icon icon;

  TextLayoutModel(this.text, {this.textColor=Colors.black, this.textBackgroundColor=Colors.transparent,
      this.textSize=14.0, this.backgroundModel=TextLayoutBackgroundModel.rrect,this.backGroundRadius=8,
    this.border,this.isTextColorRandom=false,this.icon,this.imag,this.isShowCirPoint=false,});


}

enum TextLayoutBackgroundModel{
  ///无背景
  none,
  ///矩形背景
  rect,
  ///矩形边框
  rectBorder,
  ///矩形背景+矩形边框
  rectBackgroundAndBorder,
  ///圆角矩形背景 通过backGroundRadius来配置圆角的大小
  rrect,
  ///圆角矩形边框
  rrectBorder,
  ///圆角矩形背景+边框
  rrectBackgroundAndBorder,
  ///椭圆背景
  oval,
  ///椭圆边框
  ovalBorder,
  ///椭圆边框 + 背景
  ovalBackgroundAndBorder,
}