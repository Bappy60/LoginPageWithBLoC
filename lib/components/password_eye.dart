import 'package:flutter/material.dart';

class PasswordEye extends StatefulWidget {
  final VoidCallback? onTap;
  final bool obscureText;

  const PasswordEye({
    super.key,
    this.onTap,
    this.obscureText = true,
  });

  @override
  PasswordEyeState createState() => PasswordEyeState();
}

class PasswordEyeState extends State<PasswordEye> {
  bool _isObscure = true;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
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
          color: _isObscure? Colors.blue.withOpacity(0.2): null,
        ),
        padding: const EdgeInsets.all(9.5),
        child: Icon(
          _isObscure ? Icons.visibility_off : Icons.visibility,
        ),
      ),
    );
  }
}
