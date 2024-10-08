import 'package:flutter/material.dart';

import '../constants/consts.dart';

class CustomTextInputFieldWithIcon extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final Widget? trailingIcon;

  const CustomTextInputFieldWithIcon({
    super.key,
    required this.hintText,
    required this.textEditingController,
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
              // obscureText: ,
              controller: textEditingController,
              style: kDefaultTextStyle.copyWith(color: Colors.black),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: hintText,
                isCollapsed: true,
                hintStyle: kHintTextStyle,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    const EdgeInsets.fromLTRB(16.0, 12.5, 16.0, 12.5),
              ),
            ),
          ),
          if (trailingIcon != null) trailingIcon!,
        ],
      ),
    );
  }
}
