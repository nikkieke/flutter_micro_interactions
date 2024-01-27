import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';


class ProgressDetailList extends StatelessWidget {
  const ProgressDetailList({
    super.key,
    required AnimationController animationController,
  }) : _animationController = animationController;

  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}