import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'animation_executor.dart';

class TextSpeechWidget extends StatefulWidget {
  const TextSpeechWidget({
    super.key,
    required this.textCtr,
    required this.riveAnimation,
    required this.tapped,
    required this.isSpeechOn,
    required this.focusNode, required this.controller,
  });

  final TextEditingController textCtr;
  final RiveAnimation riveAnimation;
  final VoidCallback tapped;
  final bool isSpeechOn;
  final FocusNode focusNode;
  final AnimationController controller;


  @override
  State<TextSpeechWidget> createState() => _TextSpeechWidgetState();
}

class _TextSpeechWidgetState extends State<TextSpeechWidget> {


  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: AnimationExecutor(
        horizontalOffset: 0.0,
        verticalOffset: 20,
        begin: 0,
        end: 0.9,
        animationController: widget.controller,
        isFirstPage: false,
        child: SingleChildScrollView(
          child: FadeTransition(
            opacity: widget.controller,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.maxFinite,
              height: 250,
              color: const Color(0xff1f1f1f),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  widget.isSpeechOn?
                  Container():
                  TextField(
                    onTap: widget.tapped,
                      focusNode: widget.focusNode,
                    controller: widget.textCtr,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Start typing or speaking",
                      hintStyle: TextStyle(color: Color(0xff929292)),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    onEditingComplete: (){
                      widget.textCtr.clear();
                    }
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 100,
                    width: double.maxFinite,
                    child: widget.riveAnimation,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}