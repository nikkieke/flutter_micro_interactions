import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';


class HourHand extends CustomPainter{
  final DateTime currentTime;

  Paint hoursNeedlePaint = Paint()
    ..color = UiColors.mustard
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;


  HourHand({required this.currentTime});

  @override
  void paint(Canvas canvas, Size size) {
    final width= size.width;
    final height = size.height;

    final radius = min(width, height) / 2;
    canvas.save();

    //drawing
    canvas.translate(radius, radius);

    //checks if hour is greater than 12 before calculating rotation
    canvas.rotate(currentTime.hour >=12?
    2*pi*((currentTime.hour-12)/12 + (currentTime.hour/720)):
    2*pi*((currentTime.hour/12)+ (currentTime.hour/720))
    );
    Path path= Path();

    //hour hand stem
    path.moveTo(-1.5, -radius/2);
    path.lineTo(1.5, radius/6);


    canvas.drawPath(path, hoursNeedlePaint);
    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
