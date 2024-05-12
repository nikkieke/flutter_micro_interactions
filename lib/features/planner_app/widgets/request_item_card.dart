import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_micro_interactions/features/features.dart';


class RequestItemCard extends StatelessWidget {
  const RequestItemCard({
    required this.model,
    super.key,
  });

  final RequestItem model;

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                SvgPicture.asset(model.iconPath,
                  width: 20,
                  colorFilter: model.isCompleted?
                  const ColorFilter.mode(
                     Color(0xff929292),
                    BlendMode.srcIn,
                  ):
                  const ColorFilter.mode(
                    Color(0xff3b937e),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 30,),
                Text(model.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color(0xffededed)),),
                const SizedBox(height: 10,),
                Text(model.isCompleted?'Completed':'In progress', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: const Color(0xff929292)),),
              ],
            ),
          ),
          model.isCompleted?
              Container():
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: PercentIndicatorLinear(),
          ),
        ],
      ),
    );
  }
}

