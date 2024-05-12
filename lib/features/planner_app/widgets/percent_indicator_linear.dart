import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentIndicatorLinear extends StatelessWidget {
  const PercentIndicatorLinear({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      padding: EdgeInsets.zero,
      lineHeight: 3,
      backgroundColor: Colors.transparent,
      percent: 0.4,
      progressColor: const Color(0xff3b937e),
      barRadius: const Radius.circular(2),
    );
  }
}