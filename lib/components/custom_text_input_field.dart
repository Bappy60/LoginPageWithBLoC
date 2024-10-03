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
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: kHintTextStyle,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: hintText,
                isCollapsed: true,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(16.0, 12.5, 16.0, 12.5),
              ),
            ),
          ),
          if (trailingIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              // Add space between icon and text field
              child: trailingIcon,
            ),
        ],
      ),
    );
  }
}
