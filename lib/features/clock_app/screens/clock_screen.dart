import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instant/instant.dart';
import 'package:intl/intl.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen>
    with TickerProviderStateMixin {
  int selectedIndex = 0;

  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _secondAnimation;
  late AnimationController _secondAnimationController;

  String currentTime =
      DateFormat('hh:mm:ss a').format(curDateTimeByZone(zone: 'GMT'));
  late Timer _timer;
  DateTime now = DateTime.now();

  @override
  void initState() {
    ///define animation controller properties
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _secondAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    ///add listener so that when the animation reaches the end, it reverses
    ///to the start
    _animation = Tween(begin: 1.0, end: 0.9).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _secondAnimation =
        Tween(begin: 1.0, end: 0.9).animate(_secondAnimationController)
          ..addListener(() {
            setState(() {});
          });

    ///reverses the animated widget to the beginning state,
    ///ie to show that animation has been completed
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
    _secondAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _secondAnimationController.reverse();
      }
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        selectedIndex == 0
            ? currentTime =
                DateFormat('hh:mm:ss a').format(curDateTimeByZone(zone: 'GMT'))
            : currentTime =
                DateFormat('hh:mm:ss a').format(curDateTimeByZone(zone: 'EDT'));
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void handleButtonPress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.lightBlueBG,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(right: 20, top: 30, left: 20),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/menu_bar.svg',
                      ),
                    ),
                    const UiTexts(
                      text: 'WORLD CLOCK',
                      size: 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                AnimatedCrossFade(
                  firstChild: UiTexts(text: currentTime, size: 45),
                  secondChild: UiTexts(text: currentTime, size: 45),
                  crossFadeState: selectedIndex == 0
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 600),
                ),
                const SizedBox(
                  height: 20,
                ),
                ClockFace(
                  isLondonSelected: selectedIndex == 0,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: _animation.value,
                      child: Button(
                        title: 'LONDON',
                        onPressed: () {
                          handleButtonPress(1);
                          _animationController.forward();
                        },
                        isSelected: selectedIndex == 1,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Transform.scale(
                      scale: _secondAnimation.value,
                      child: Button(
                        title: 'NEW YORK',
                        onPressed: () {
                          handleButtonPress(0);
                          _secondAnimationController.forward();
                        },
                        isSelected: selectedIndex == 0,
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
