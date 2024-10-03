import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget? iconData;

  // final double iconSize;
  final EdgeInsets padding;
  final Function()? onPressed;

  const CustomIconButton({
    super.key,
    this.iconData,
    // this.iconSize = 24.0,
    this.padding = const EdgeInsets.all(12),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        child: Center(
          child: iconData,
        ),
      ),
    );
  }
}
