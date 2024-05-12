import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';


class SecondHand extends CustomPainter{
  final DateTime currentTime;

  Paint secondsNeedlePaint = Paint()
    ..color = UiColors.cherryRed
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;

  Paint secondsPoint = Paint()
    ..color = UiColors.cherryRed
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.fill;

  SecondHand({required this.currentTime});

  @override
  void paint(Canvas canvas, Size size) {
    final width= size.width;
    final height = size.height;

    final radius = min(width, height) / 2;
    canvas.save();

    //drawing
    canvas.translate(radius, radius);

    canvas.rotate(2*pi*currentTime.second/60);

    Path path1= Path();
    Path path2 = Path();

    path1.moveTo(0.0, -radius/1.3);
    path1.lineTo(0.0, radius/6);

    path2.addOval(Rect.fromCircle(radius: 7.0, center: const Offset(0.0, 0.0)));

    canvas.drawPath(path1, secondsNeedlePaint);
    canvas.drawPath(path2, secondsPoint);

    canvas.restore();

  }

  @override
  bool shouldRepaint(SecondHand oldDelegate) {
    return currentTime.second != oldDelegate.currentTime.second;
  }
}