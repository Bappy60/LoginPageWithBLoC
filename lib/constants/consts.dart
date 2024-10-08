import 'package:flutter/material.dart';

var kDefaultTextStyle = const TextStyle(
  fontFamily: 'Metropolis',
  color: Color.fromRGBO(50, 50, 50, 0.60),
  fontSize: 12.0,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
);
var kHintTextStyle = const TextStyle(
  fontFamily: 'Metropolis',
  color: Color.fromRGBO(50, 50, 50, 0.60),
  fontSize: 12.0,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
);

var kForgotPasswordTextStyle = const TextStyle(
  fontFamily: 'Metropolis',
  color: Color.fromRGBO(50, 50, 50, 0.60),
  fontSize: 10.0,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  height: 1.0,
);

var kLoginTextStyle = const TextStyle(
  fontFamily: 'Metropolis',
  color: Color(0xF0000000),
  fontSize: 17.0,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
);
var kNextButtonTextStyle = const TextStyle(
  fontFamily: 'Metropolis',
  color: Colors.white,
  fontSize: 17.0,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  height: 1.0,
);

var kDefaultBoxDecorationStyle = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular((2 << 16).toDouble()),
  ),
  color: Colors.white,
  border: Border.all(
    color: const Color(0xFF323232),
  ),
);

var kNextButtonBoxDecorationStyle = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular((2 << 16).toDouble())),
  color: const Color(0xFF323232),
  border: Border.all(
    color: const Color(0xFF323232), // Border color
    width: 1.0, // Border width
  ),
);

var kRegisterTextStyle = const TextStyle(
  fontFamily: 'Metropolis',
  color: Color(0xFF323232),
  fontSize: 14.0,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  height: 1.0,
);
