
import 'package:flutter/cupertino.dart';

///自定义绘图者
class TextLayoutPainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    //绘制一条直线
    canvas.drawLine(Offset(20, 20), Offset(100, 100), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}