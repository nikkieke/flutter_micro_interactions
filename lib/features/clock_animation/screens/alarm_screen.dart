import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';
import 'package:flutter_svg/svg.dart';


class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: UiColors.lightBlueBG,
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30, top: 30, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/menu_bar.svg',
                      ),
                    ),
                    const UiTexts(text: 'ALARM', size: 25,),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 30)),
              Stack(
                children: [
                  Row(
                    children: [
                      const UiTexts(text: 'Everyday', size: 25,),
                    ],
                  ),
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
                ]
              )
            ],
          )
      ),
    );
  }
}
