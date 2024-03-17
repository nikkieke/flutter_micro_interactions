import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';


class AlarmWidget extends StatelessWidget {
  const AlarmWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 250,
                  width: 200,
                  decoration: BoxDecoration(
                      color: UiColors.lightBlueCard,
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      boxShadow:
                      [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-2, -2),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ]
                  ),
                  child: const Text('AM', style:
                  TextStyle(fontSize: 100,
                    fontWeight: FontWeight.w800,
                    color: Color(0xffd1d6ed),
                  ),),
                ),
                const Column(
                  children: [
                    UiTexts(text: 'Everyday', size: 30,),
                    SizedBox(height: 20,),
                    UiTexts(text: '05:00', size: 50,),
                  ],
                ),
              ]
          ),
          const SizedBox(width: 30,),
          Container(
            padding: const EdgeInsets.all(7),
            height: 150,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(45)),
                border: Border.all(color: Colors.white, width: 2,),
                color: UiColors.lightBlueCard,
                boxShadow:
                [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff775d91),
                  boxShadow:
                  [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(5, 5),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, -5),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ]
              ),
              child: const Text(
                'OFF',
                style: TextStyle(
                  color: Color(0xff9c86b3),
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
