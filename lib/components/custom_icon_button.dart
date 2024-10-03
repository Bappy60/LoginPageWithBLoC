import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget? iconData;
  final EdgeInsets? padding;
  final Function()? onPressed;

  const CustomIconButton({
    super.key,
    this.iconData,
    this.padding,
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
