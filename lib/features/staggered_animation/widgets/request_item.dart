import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RequestItem extends StatelessWidget {
  const RequestItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      decoration: const BoxDecoration(
        color: Color(0xff1f1f1f),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/flight-takeoff.svg',
                  colorFilter: const ColorFilter.mode(
                    Color(0xff3b937e),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 30,),
                Text('Business Trip in New York', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color(0xffededed)),),
                const SizedBox(height: 10,),
                Text('In progress', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: const Color(0xff929292)),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: LinearPercentIndicator(
              padding: EdgeInsets.zero,
              lineHeight: 3,
              backgroundColor: Colors.transparent,
              percent: 0.4,
              progressColor: const Color(0xff3b937e),
              barRadius: const Radius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}