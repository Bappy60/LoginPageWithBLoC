import 'package:flutter/material.dart';

import '../constants/consts.dart';

class CustomTextInputFieldWithIcon extends StatelessWidget {
  final String hintText;
  final Widget? trailingIcon;

  const CustomTextInputFieldWithIcon({
    super.key,
    required this.hintText,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kDefaultBoxDecorationStyle,
      child: TextField(
        cursorHeight: 12.0,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: kHintTextStyle,
          isCollapsed: true,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
          suffixIcon: trailingIcon,
        ),
      ),
    );
  }
}
