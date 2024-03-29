import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/clock_animation/clock_animation.dart';

class MinutesHand extends CustomPainter{
  final DateTime currentTime;

  Paint minutesNeedlePaint = Paint()
    ..color = UiColors.darkViolet
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;

  MinutesHand({required this.currentTime});

  @override
  void paint(Canvas canvas, Size size) {
    final width= size.width;
    final height = size.height;

    final radius = min(width, height) / 2;
    canvas.save();

    //drawing
    canvas.translate(radius, radius);

    canvas.rotate(2*pi*((currentTime.minute+(currentTime.second/60))/60));

    Path path= Path();
    path.moveTo(-1.5, -radius/1.5);
    path.lineTo(1.5, radius/6);

    canvas.drawPath(path, minutesNeedlePaint);



    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
