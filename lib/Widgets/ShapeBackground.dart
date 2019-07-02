import 'package:flutter/material.dart';

class ShapeBackground extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    _centerElementPaint(canvas, size);
  }

  void _centerElementPaint(Canvas canvas, Size size) {
    Paint lineStroke = new Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTRB(0, 0, 10, 10), lineStroke );

  }
  @override
  bool shouldRepaint(ShapeBackground oldDelegate) {
    return true;
  }
}