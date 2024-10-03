import 'package:flutter/material.dart';

import '../constants/consts.dart';

class CustomGestureDetectorContainer extends StatelessWidget {
  final String text;
  final Decoration? containerDecoration;
  final TextStyle? textStyle;
  final AlignmentGeometry? textAlignment;
  final EdgeInsetsGeometry? textPadding;
  final Function()? onTap;

  const CustomGestureDetectorContainer({
    super.key,
    required this.text,
    this.containerDecoration,
    this.textStyle,
    this.textAlignment,
    this.textPadding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: containerDecoration,
        alignment: textAlignment ?? Alignment.centerLeft,
        child: Padding(
          padding: textPadding ?? EdgeInsets.zero,
          child: Text(
            text,
            style: textStyle ?? kDefaultTextStyle,
          ),
        ),
      ),
    );
  }
}
