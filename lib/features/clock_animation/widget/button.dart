import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';

class Button extends StatefulWidget {
  const Button({
    super.key, required this.title, required this.onPressed, required this.isSelected, required this.animation,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isSelected;
  final Animation animation;



  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin{
  //define animation controller and animation
  // late AnimationController _animationController;
  // late Animation<double>_animation;
  //
  // @override
  // void initState() {
  //   //define animation controller properties
  //   _animationController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(milliseconds: 200),
  //   );
  //   //add listener so that when the animation reaches the end, it reverses the widget
  //   //to the start
  //   _animation = Tween(begin: 1.0, end: 0.9).animate(_animationController)
  //     ..addListener(() {
  //       setState(() {});
  //     });
  //   //reverses the animated widget to the beginning state,
  //   //ie to show that animation has been completed
  //   _animationController.addStatusListener((status) {
  //     if (status == AnimationStatus.completed) {
  //       _animationController.reverse();
  //     }
  //   });
  //   super.initState();
  // }
  //
  //
  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      // onTap: (){
      //   // _animationController.forward();
      //   // print('here');
      //  widget.onPressed;
      // },
      onTap: widget.onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 160,
        decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20),),
            color: widget.isSelected? UiColors.mustard: UiColors.lightBlueBG,
            border: Border.all(color: Colors.white, width: 2),
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
        child:  UiTexts(text: widget.title, size: 25,),
      ),
    );
  }
}