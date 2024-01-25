import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_micro_interactions/utils/utils.dart';


class StaggeredAnimationScreen extends StatefulWidget {
  const StaggeredAnimationScreen({Key? key}) : super(key: key);

  @override
  State<StaggeredAnimationScreen> createState() => _StaggeredAnimationScreenState();
}

class _StaggeredAnimationScreenState extends State<StaggeredAnimationScreen>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin{
  @override
  bool get wantKeepAlive => true;

  final controller = PageController(keepPage: true);
   late AnimationController _animationController;


  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animationController.forward();
    controller.addListener(() {
      currentPage = controller.page!.round();
      if(currentPage == controller.page) {
        _animationController
          ..reset()
          ..forward();

      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _animationController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: PageView(
        controller: controller,
        onPageChanged: (currentPage) {

        },
        physics: const CustomPageViewScrollPhysics(),
        children: [
          AnimatedBuilder(animation: _animationController,
              builder: (BuildContext context, Widget? child) {
                return  RequestScreen(animationController: _animationController,);
              }),
          AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget? child){
                return  MakeRequestScreen(animationController: _animationController,);
              }),
          Container()
        ],

      ),
      bottomNavigationBar: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 10),
        height: 30,
        decoration:  BoxDecoration(
          color: currentPage==1? const Color(0xff1f1f1f):const Color(0xff181818),
          boxShadow: [
            BoxShadow(
              color: currentPage==1? const Color(0xff1f1f1f):const Color(0xff181818),
              spreadRadius: 30,
              blurRadius: 70,
            ),
          ]
        ),
        child: SmoothPageIndicator(
          controller: controller,
          count: 3,
          effect: const ExpandingDotsEffect(
            expansionFactor: 5,
            dotHeight: 4,
            dotWidth: 8,
            activeDotColor: Colors.white,
            dotColor: Color(0xff929292),
          ),
        ),
      ),
    );
  }
}


