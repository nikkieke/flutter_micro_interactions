import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class TextSpeechButton extends StatelessWidget {
  const TextSpeechButton({
    super.key,
    required this.micTapped,
    required this.isSpeechOn,
    required this.keyboardTapped,
    required this.controller,
  });

  final VoidCallback micTapped;
  final VoidCallback keyboardTapped;
  final bool isSpeechOn;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;


    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
          bottom: Tween<double>(begin: 0, end: screenHeight/4.8).animate(controller).value,
          left: 0,
          right: - screenWidth/1.4,
          child: isSpeechOn?
          InkWell(
            customBorder: const CircleBorder(),
            splashColor: const Color(0xff181818),
            onTap: keyboardTapped,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 50,
              decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Color(0xff303030)
              ),
              child: SvgPicture.asset(
                  'assets/images/keyboard.svg',
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    Color(0xff929292),
                    BlendMode.srcIn,
                  )
              ),
            ),
          ):
          InkWell(
            splashColor: const Color(0xff181818),
            onTap: micTapped,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 50,
              decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Color(0xff303030)
              ),
              child: SvgPicture.asset(
                  'assets/images/mic.svg',
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    Color(0xff929292),
                    BlendMode.srcIn,
                  )
              ),
            ),
          ),
        );
      },
    );
  }
}