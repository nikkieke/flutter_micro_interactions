import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class StaggeredAnimationScreen extends StatefulWidget {
  const StaggeredAnimationScreen({Key? key}) : super(key: key);

  @override
  State<StaggeredAnimationScreen> createState() => _StaggeredAnimationScreenState();
}

class _StaggeredAnimationScreenState extends State<StaggeredAnimationScreen> {
  final controller = PageController(keepPage: true);


  final List<Widget> pages = [
    const RequestScreen(),
    const MakeRequestScreen(),
    Container()
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: PageView(
        controller: controller,
        children: [
          ...pages,
        ],

      ),
      bottomNavigationBar: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 10),
        height: 30,
        decoration:  BoxDecoration(
          color: controller.hasClients ? controller.page==1? const Color(0xff1f1f1f):const Color(0xff181818):
          const Color(0xff181818),
          boxShadow: [
            BoxShadow(
              color: controller.hasClients ? controller.page==1? const Color(0xff1f1f1f):const Color(0xff181818):
              const Color(0xff181818),
              spreadRadius: 30,
              blurRadius: 70,
              //offset: const Offset(0, 2),
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


