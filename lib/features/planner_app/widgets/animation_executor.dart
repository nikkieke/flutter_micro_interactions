import 'package:flutter/material.dart';

class AnimationExecutor extends StatefulWidget {
  const AnimationExecutor({super.key,
    required this.child,
    required this.horizontalOffset,
    required this.verticalOffset,
    required this.begin,
    required this.end,
    required this.animationController, required this.isFirstPage,});

  final Widget child;

  final double horizontalOffset;

  final double verticalOffset;

  final double begin;

  final double end;

  final AnimationController animationController;

  final bool isFirstPage;



  @override
  State<AnimationExecutor> createState() => _AnimationExecutorState();
}

class _AnimationExecutorState extends State<AnimationExecutor> {



  @override
  Widget build(BuildContext context) {
    return _slideAnimation(widget.animationController);
  }


  Widget _slideAnimation(Animation<double>animation,){
    Animation<double> offsetAnimation(double offset, Animation<double> animation){
      return Tween<double>(
          begin: widget.isFirstPage? -offset: offset, end: 0.0).animate(
        CurvedAnimation(
            parent: animation,
            curve: Interval(widget.begin, widget.end,
                curve: widget.isFirstPage? Curves.bounceOut: Curves.easeIn)
        )
      );
    }
    return Transform.translate(
      offset: Offset(
        widget.horizontalOffset==0.0? 0.0: offsetAnimation(widget.horizontalOffset, animation).value,
        widget.verticalOffset==0.0? 0.0: offsetAnimation(widget.verticalOffset, animation).value,
      ),
      child: widget.child,
    );
  }
}


