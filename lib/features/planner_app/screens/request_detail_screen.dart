import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_micro_interactions/features/features.dart';


Route createRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => const RequestDetailScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      final scale = Tween<double>(
        begin: 0.4,
        end: 1,
      ).chain(CurveTween(curve: Curves.easeOutCubic)).animate(animation);

      return ScaleTransition(
        alignment: Alignment.centerLeft,
        scale: scale,
        child: child,
      );
    },
  );
}




class RequestDetailScreen extends StatefulWidget {
  const RequestDetailScreen({super.key});

  @override
  State<RequestDetailScreen> createState() => _RequestDetailScreenState();
}

class _RequestDetailScreenState extends State<RequestDetailScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animationController.forward();

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
      builder: (BuildContext context, Widget? child) {
          return Scaffold(
            backgroundColor: const Color(0xff181818),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          height: 50,
                          decoration: const ShapeDecoration(
                              shape: CircleBorder(),
                              color: Color(0xff303030)
                          ),
                          child: SvgPicture.asset(
                              'assets/images/close.svg',
                              width: 20,
                              colorFilter: const ColorFilter.mode(
                                Color(0xff929292),
                                BlendMode.srcIn,
                              )
                          ),
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/images/flight-takeoff.svg',
                      width: 20,
                      colorFilter: const ColorFilter.mode(
                        Color(0xff3b937e),
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Text('Business Trip in New York', style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffededed)),),
                    const SizedBox(height: 30,),
                    Text('Created Sep. 30th', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff929292)),),
                    const SizedBox(height: 50,),
                    const Divider(height: 0.1, color: Colors.white10,),
                    const SizedBox(height: 50,),
                    Text('In Progress', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: const Color(0xff929292)),),
                    const SizedBox(height: 10,),
                    const PercentIndicatorLinear(),
                    const SizedBox(height: 10,),
                    ProgressDetailList(animationController: _animationController)
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 10),
              height: 30,
              decoration:  const BoxDecoration(
                  color: Color(0xff181818),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff181818),
                      spreadRadius: 30,
                      blurRadius: 70,
                    ),
                  ]
              ),
            ),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: const Color(0xff3b937e),
              child: SizedBox(
                height: 40,
                child: SvgPicture.asset('assets/images/message.svg',
                    width: 20,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    )
                ),
              ),
              onPressed: () {  },

            ),
          );
      },
    );
  }
}




