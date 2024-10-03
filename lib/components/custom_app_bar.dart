import 'package:auth_using_bloc/constants/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool allowBackButton;
  final Widget? trailingIcon;

  const CustomAppBar({
    super.key,
    required this.title,
    this.allowBackButton = true,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // If back button not allowed, set `leading` to null
      leading: allowBackButton
          ? Container(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
                'assets/icons/arrow-down.svg',
                width: 24,
                height: 24,
              ),
          )
          : null,
      title: Text(
        title,
        style: kLoginTextStyle,
      ),
      centerTitle: true,
      actions: [
        // If trailingIcon is null, add a placeholder
        allowBackButton
            ? (trailingIcon ?? const SizedBox(width: 56))
            : (trailingIcon ?? const SizedBox(width: 56)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
