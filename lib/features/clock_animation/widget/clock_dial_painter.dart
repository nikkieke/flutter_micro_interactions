import 'dart:math';

import 'package:flutter/material.dart';

class ClockDialPainter extends CustomPainter{
  final tickerHeight = 5.0;

  final tickerWidth= 2.5;
  final Paint tickPaint = Paint()
    ..color = Colors.black
    ..strokeWidth = 3;

  final Paint quarterTickPaint = Paint()
    ..color =  Colors.red
    ..strokeWidth = 3;


  @override
  void paint(Canvas canvas, Size size) {
    const angle= 2 * pi / 60;
    final width= size.width;
    final height = size.height;

    final radius = min(width, height) / 2;
    final centerOffset = Offset(width / 2, height / 2);
    canvas.save();

    // drawing
    canvas.translate(centerOffset.dx, centerOffset.dy);

    for (var i = 0; i< 60; i++ ) {
      bool isQuarterHour = i % 15 == 0;


      if (isQuarterHour) {
        canvas.drawLine(Offset(0, -radius ), Offset(0, -radius + tickerHeight), quarterTickPaint);

      } else {
        canvas.drawLine(Offset(0, -radius), Offset(0, -radius + tickerHeight), tickPaint);
      }
      if (i == 0) {}


      canvas.rotate(angle);
    }

    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}