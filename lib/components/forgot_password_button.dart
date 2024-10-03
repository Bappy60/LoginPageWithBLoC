import 'package:flutter/material.dart';

import '../constants/consts.dart';

class ForgotPasswordButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const ForgotPasswordButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding:EdgeInsets.zero,
          child: Text(
            text,
            style: kDefaultTextStyle,
          ),
        ),
      ),
    );
  }
}
