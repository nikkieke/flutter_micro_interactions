import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';


class AlarmWidget extends StatefulWidget {
  const AlarmWidget({
    super.key, required this.alarmDay1, required this.alarmDay2, required this.time, required this.onTap, required this.isSelected,
  });

  final String alarmDay1;
  final String alarmDay2;
  final String time;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  State<AlarmWidget> createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                    color: widget.isSelected? UiColors.mustard: UiColors.lightBlueAccent,
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
                child:  Text('AM', style:
                TextStyle(fontSize: 100,
                  fontWeight: FontWeight.w800,
                  color: widget.isSelected?
                   Colors.white24:const Color(0xffd1d6ed),
                ),),
              ),
               Column(
                children: [
                  Row(
                    children: [
                      UiTexts(text: widget.alarmDay1, size: 30,),
                      const SizedBox(width: 20,),
                      UiTexts(text: widget.alarmDay2, size: 30,),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  UiTexts(text: widget.time, size: 50,),
                ],
              ),
            ]
        ),
        const SizedBox(width: 30,),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
               height: 170,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(47)),
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
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              top: widget.isSelected? 0 : 65,
              left: 0,
              right: 0,
              curve: Curves.easeIn,
              child: InkWell(
                onTap: widget.onTap,
                child: Container(
                  height: 100,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient:  LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            widget.isSelected? UiColors.mustard: const Color(0xff4a3863),
                            widget.isSelected? UiColors.mustard: const Color(0xff775d91),
                          ]
                      ),
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
                  child:  Text(
                    widget.isSelected?'ON':'OFF',
                    style:  TextStyle(
                      color: widget.isSelected? Colors.black:const Color(0xff9c86b3),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
