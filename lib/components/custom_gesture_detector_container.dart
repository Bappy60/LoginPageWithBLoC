import 'package:flutter/material.dart';

import '../constants/consts.dart';

class GestureDetectorContainer extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool isLoading;

  const GestureDetectorContainer({
    super.key,
    required this.text,
    this.onTap,
    required this.isLoading,
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
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  text,
                  style: kNextButtonTextStyle,
                ),
        ),
      ),
    );
  }
}
