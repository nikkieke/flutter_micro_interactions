import 'package:flutter/material.dart';

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