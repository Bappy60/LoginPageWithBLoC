import 'package:flutter/material.dart';

class PasswordEye extends StatefulWidget {
  final VoidCallback? onTap;
  final bool toggleIcon;

  const PasswordEye({
    super.key,
    this.onTap,
    this.toggleIcon = true,
  });

  @override
  PasswordEyeState createState() => PasswordEyeState();
}

class PasswordEyeState extends State<PasswordEye> {
  bool _toggleIcon = true;

  void _toggleObscure() {
    setState(() {
      _toggleIcon = !_toggleIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _toggleObscure();
        widget.onTap?.call();
      },
      child: Container(
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: _toggleIcon? Colors.blue.withOpacity(0.2): null,
        ),
        padding: const EdgeInsets.all(9.5),
        child: Icon(
          _toggleIcon ? Icons.visibility_off : Icons.visibility,
        ),
      ),
    );
  }
}
