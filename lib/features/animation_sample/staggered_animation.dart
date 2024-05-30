import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  final controller = PageController(keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [
            Page1(pageController: controller,),
            Page2(pageController: controller,),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 10),
        height: 30,
        child:  SmoothPageIndicator(
          controller: controller,
          count: 2,
          effect: const JumpingDotEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.grey,
            dotColor: Colors.black12,
          ),
        ),
      )
    );
  }
}


class Page1 extends StatelessWidget {
  const Page1({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
          children: AnimateList.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              controller: pageController,
              horizontalOffset: MediaQuery.of(context).size.width / 2,
              children: [
                const EmptyCard(width: 250, height: 50,),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: EmptyCard(width: 180, height: 80,),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: EmptyCard(width: 270, height: 50,),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EmptyCard(height: 50, width: 70),
                      EmptyCard(height: 50, width: 70),
                      EmptyCard(height: 50, width: 70),
                    ],
                  ),
                ),
                const EmptyCard(width: 250, height: 50,),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: EmptyCard(width: 180, height: 80,),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: EmptyCard(width: 270, height: 50,),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EmptyCard(height: 50, width: 70),
                      EmptyCard(height: 50, width: 70),
                      EmptyCard(height: 50, width: 70),
                    ],
                  ),
                ),
            ],
          ),

      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: AnimateList.toStaggeredList(
          duration: const Duration(milliseconds: 375),
          controller: pageController,
          horizontalOffset: MediaQuery.of(context).size.width / 2,
          children: [
            const EmptyCard(width: 220, height: 70,),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: EmptyCard(width: 300, height: 70,),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: EmptyCard(width: 200, height: 50,),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EmptyCard(height: 70, width: 70),
                  EmptyCard(height: 70, width: 70),
                ],
              ),
            ),
            const EmptyCard(width: 220, height: 70,),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: EmptyCard(width: 300, height: 70,),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EmptyCard(height: 70, width: 70),
                  EmptyCard(height: 70, width: 70),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}

class AnimateList{

  static List<Widget>toStaggeredList({
    required Duration duration,
    double? horizontalOffset,
    required PageController controller,
    required List<Widget>children,
})=> children
      .asMap()
      .map((index, widget){
        return MapEntry(
            index,
            AnimateWidget(
              duration: duration,
              position: index,
              horizontalOffset: horizontalOffset,
              controller: controller,
              child: widget,
            )
        );
  })
      .values
      .toList();

}

class AnimateWidget extends StatefulWidget {
  const AnimateWidget({super.key,
    required this.duration,
    required this.position,
    required this.horizontalOffset,
    required this.child,
    required this.controller,
  });

  final Duration duration;
  final int position;
  final double? horizontalOffset;
  final Widget child;
  final PageController controller;

  @override
  State<AnimateWidget> createState() => _AnimateWidgetState();
}

class _AnimateWidgetState extends State<AnimateWidget> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin{
  @override
  bool get wantKeepAlive => true;

  late AnimationController animationController;
  int currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: widget.duration);
    _timer = Timer(getDelay(), animationController.forward);

    widget.controller.addListener(() {
      currentPage = widget.controller.page!.round();
      if(currentPage == widget.controller.page){
        _timer = Timer(getDelay(), animationController.forward);
      }

    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    animationController.dispose();
    super.dispose();
  }

  Duration getDelay(){
    var delayInMilliSec = widget.duration.inMilliseconds ~/ 6;

    int getStaggeredListDuration(){
      return widget.position * delayInMilliSec;
    }

    return Duration(milliseconds: getStaggeredListDuration());
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child){
          return _slideAnimation(animationController);
        }
    );
  }

  Widget _slideAnimation(Animation<double> animationController){
    Animation<double> offsetAnimation(double offset, Animation<double> animationController) {
      return Tween<double>(begin: offset, end: 0.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: const Interval(0.0, 1.0, curve: Curves.ease),
        ),
      );
    }

    return Transform.translate(
      offset: Offset(
        widget.horizontalOffset == 0.0 ? 0.0 : offsetAnimation(widget.horizontalOffset!, animationController).value,
        0.0,
      ),
      child: widget.child,
    );

  }
}




