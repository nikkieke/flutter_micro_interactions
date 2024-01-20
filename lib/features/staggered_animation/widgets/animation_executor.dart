import 'package:flutter/material.dart';

class AnimationExecutor extends StatefulWidget {
  const AnimationExecutor({super.key,
    required this.child,
    required this.horizontalOffset,
    required this.verticalOffset, required this.begin, required this.end, required this.animationStart,});

  final Widget child;

  final double horizontalOffset;

  final double verticalOffset;

  final double begin;

  final double end;

  final bool animationStart;

  @override
  State<AnimationExecutor> createState() => _AnimationExecutorState();
}

class _AnimationExecutorState extends State<AnimationExecutor> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 4),
    );
    startAnimation();

  }

  void startAnimation(){
    if(widget.animationStart == true){
      _animationController.forward();
    }
  }



  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
        animation: _animationController,
        builder: (context, child){
          return _slideAnimation(_animationController);
        }
    );
  }


  Widget _slideAnimation(Animation<double>animation,){
    Animation<double> offsetAnimation(double offset, Animation<double> animation){
      return Tween<double>(begin: offset, end: 0.0).animate(
        CurvedAnimation(
            parent: animation,
            curve: Interval(widget.begin, widget.end, curve: Curves.easeIn)
        )
      );
    }
    return Transform.translate(offset: Offset(
        widget.horizontalOffset==0.0? 0.0: offsetAnimation(widget.horizontalOffset, animation).value,
        widget.verticalOffset==0.0? 0.0: offsetAnimation(widget.verticalOffset, animation).value,
      ),
      child: widget.child,
    );
  }
}


