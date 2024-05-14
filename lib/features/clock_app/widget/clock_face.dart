import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instant/instant.dart';
import 'package:flutter_micro_interactions/features/features.dart';


class ClockFace extends StatefulWidget {
  const ClockFace({
    super.key, required this.isLondonSelected,
  });

  final bool isLondonSelected;

  @override
  State<ClockFace> createState() => _ClockFaceState();
}

class _ClockFaceState extends State<ClockFace> {
  /// This is the default time
  DateTime currentDateAndTime = curDateTimeByZone(zone: 'GMT');
  /// This is the timer that invokes a callback after every one second
  /// with this we can mimick a clock that counts after every second
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        ///Switches current time depending on which button is clicked
        widget.isLondonSelected == true?
        currentDateAndTime = curDateTimeByZone(zone: 'GMT'):
        currentDateAndTime = curDateTimeByZone(zone: 'EDT');
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    /// disposes the timer to clean up resources and prevent performance issues
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          Container(
            height: 320,
            width: double.maxFinite,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:const Color(0xffE7EEFC),
                border: Border.all(color: const Color(0xffE4EAF8), width: 0.8,),
                boxShadow:
                const [
                  BoxShadow(
                    color: Color(0xffE7EEFC),
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.white54,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]
            ),
            child: CustomPaint(
              painter: ClockDialPainter(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 240,
              width: double.maxFinite,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:const Color(0xffEEF3FB),
                border: Border.all(color: const Color(0xffE4EAF8), width: 2,),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 100,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color:Color(0xffEEF3FB),
                  boxShadow:
                  [
                    BoxShadow(
                      color: Color(0xffE5EDF9),
                      offset: Offset(6, 6),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white10,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ]
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                height: 320,
                width: double.maxFinite,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color:Colors.transparent,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CustomPaint(
                      painter: HourHand(currentTime: currentDateAndTime),
                    ),
                    CustomPaint(
                      painter: MinutesHand(currentTime: currentDateAndTime),
                    ),
                    CustomPaint(
                      painter: SecondHand(currentTime: currentDateAndTime),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





