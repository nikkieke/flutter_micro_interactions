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
            ],
          )
      ),
    );
  }
}
