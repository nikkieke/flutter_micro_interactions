import 'package:flutter/material.dart';

class ClockFace extends StatelessWidget {
  const ClockFace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          Container(
            height: 320,
            width: double.maxFinite,
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
        ],
      ),
    );
  }
}
