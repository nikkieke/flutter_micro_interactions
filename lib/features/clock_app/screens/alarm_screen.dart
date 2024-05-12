import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';
import 'package:flutter_svg/svg.dart';


class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  bool selected = false;
  bool selected2 = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: UiColors.lightBlueBG,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(right: 30, top: 30, left: 30),
              child: Column(
                children: [
                  Row(
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
                   SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        AlarmWidget(
                          alarmDay1: 'Everyday',
                          alarmDay2: '',
                          time: '05:00',
                          onTap: () {
                            setState(() {
                              selected = !selected;
                            });
                          },
                          isSelected: selected,
                        ),
                        const SizedBox(height: 20,),
                        AlarmWidget(
                          alarmDay1: 'SAT',
                          alarmDay2: 'MON',
                          time: '08:00',
                          onTap: () {
                            setState(() {
                              selected2 = !selected2;
                            });
                          },
                          isSelected: selected2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}

