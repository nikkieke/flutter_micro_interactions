import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';

class Button extends StatefulWidget {
  const Button({
    super.key, required this.title, required this.onPressed, required this.isSelected,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isSelected;



  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(microseconds: 100),
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