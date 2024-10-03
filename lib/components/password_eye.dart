import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class PasswordEye extends StatelessWidget {
//   final Function()? onTap;
//
//   const PasswordEye({
//     this.onTap,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(9.5),
//         child: SvgPicture.asset(
//           'assets/icons/eye.svg',
//           width: 24,
//           height: 24,
//         ),
//       ),
//     );
//   }
// }

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
