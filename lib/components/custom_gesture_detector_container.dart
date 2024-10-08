import 'package:flutter/material.dart';

import '../constants/consts.dart';

class GestureDetectorContainer extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const GestureDetectorContainer({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: kNextButtonBoxDecorationStyle,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 13, 15, 13),
          child: Text(
            text,
            style: kNextButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
