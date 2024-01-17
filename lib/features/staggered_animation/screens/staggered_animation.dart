import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_micro_interactions/utils/utils.dart';


class StaggeredAnimationScreen extends StatefulWidget {
  const StaggeredAnimationScreen({Key? key}) : super(key: key);

  @override
  State<StaggeredAnimationScreen> createState() => _StaggeredAnimationScreenState();
}

class _StaggeredAnimationScreenState extends State<StaggeredAnimationScreen> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  final controller = PageController(keepPage: true);


  final List<Widget> pages = [
    const RequestScreen(),
    const MakeRequestScreen(),
    Container()
  ];

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: PageView(
        controller: controller,
        // onPageChanged: (currentPage) => controller.animateToPage(currentPage,
        //     duration: const Duration(milliseconds: 200),
        //     curve: Curves.linearToEaseOut),
        physics: const CustomPageViewScrollPhysics(),
        children: [
          ...pages,
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


