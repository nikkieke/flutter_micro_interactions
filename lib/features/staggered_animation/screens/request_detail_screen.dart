import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../widgets/animation_executor.dart';

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
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 3,
                      backgroundColor: Colors.transparent,
                      percent: 0.4,
                      progressColor: const Color(0xff3b937e),
                      barRadius: const Radius.circular(2),
                    ),
                    const SizedBox(height: 10,),
                    Expanded(
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),),
                        shrinkWrap: true,
                        children: [
                          AnimationExecutor(
                            horizontalOffset: 0.0,
                            verticalOffset: 30,
                            begin: 0,
                            end: 0.5,
                            animationController: _animationController,
                            isFirstPage: false,
                            child: Container(
                              width: double.maxFinite,
                              height: 200,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Color(0xff1f1f1f),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Flight', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: const Color(0xff929292)),),
                                  Text('Booked', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: const Color(0xffededed)),),
                                  const SizedBox(height: 20,),
                                  const Divider(height: 0.1, color: Colors.white10,),
                                  const SizedBox(height: 40,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          const SizedBox(width: 15,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('SFO > JFK', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                                  color: const Color(0xffededed)),),
                                              Text('Tue. September, 30th', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                                  color: const Color(0xffededed)),),
                                              Text('DL 2240', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                                  color: const Color(0xff929292)),),

                                            ],
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                        color: Color(0xffededed),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          AnimationExecutor(
                            horizontalOffset: 0.0,
                            verticalOffset: 30,
                            begin: 0,
                            end: 0.7,
                            animationController: _animationController,
                            isFirstPage: false,
                            child: const ProgressDetailsCard(title: 'Hotels/Accommodation',
                              subtitle: 'Looking for options',),
                          ),
                          const SizedBox(height: 15,),
                          const ProgressDetailsCard(title: 'Commuting Details',
                            subtitle: 'Looking for options',)
                        ],

                      ),
                    )
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

class ProgressDetailsCard extends StatelessWidget {
  const ProgressDetailsCard({
    super.key, required this.title, required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xff1f1f1f),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: const Color(0xff929292)),),
          Text(subtitle, style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: const Color(0xffededed)),),
        ],
      ),
    );
  }
}
