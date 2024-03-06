import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';
import 'package:flutter_svg/svg.dart';



class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  int selectedIndex = 0;
  bool isIconTapped = true;

  void handleButtonPress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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
                    const UiTexts(text: 'WORLD CLOCK', size: 25,),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              const UiTexts(text: '04:45:11 AM', size: 45),
              Container(
                height: 350,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: UiColors.mustard
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Button(
                      title: 'LONDON',
                      onPressed: ()=> handleButtonPress(0),
                      isSelected: selectedIndex==0,
                    ),
                    const SizedBox(width: 20,),
                    Button(
                      title: 'NEW YORK',
                      onPressed: ()=>handleButtonPress(1),
                      isSelected: selectedIndex==1,
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),

    );
  }
}




