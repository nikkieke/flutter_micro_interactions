import 'package:flutter/material.dart';
import 'package:flutter_micro_interactions/features/features.dart';


class UiTexts extends StatelessWidget {
  const UiTexts({
    super.key, required this.text, required this.size,
  });

  final String text;
  final double size;


  @override
  Widget build(BuildContext context) {
    return
    Text(
      text,
      style: TextStyle(
      color: UiColors.darkMagenta,
      fontWeight: FontWeight.bold,
      fontSize: size,
    ),
    );
  }
}
