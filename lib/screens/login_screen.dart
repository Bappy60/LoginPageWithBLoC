import 'package:auth_using_bloc/components/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/custom_gesture_detector_container.dart';
import '../components/custom_text_input_field.dart';
import '../constants/consts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
            iconData: SvgPicture.asset('assets/icons/arrow-down.svg')),
        title: Center(
          child: Text(
            "Login",
            style: kLoginTextStyle,
          ),
        ),
        actions: const [
          CustomIconButton(),
          // CustomIconButton(iconData: Icons.more_vert),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 55),
              const CustomTextInputFieldWithIcon(hintText: 'Email address'),
              const SizedBox(height: 15),
              CustomTextInputFieldWithIcon(
                hintText: 'Password',
                trailingIcon: SvgPicture.asset(
                  'assets/icons/eye.svg',
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: CustomGestureDetectorContainer(text: 'Forgot password?'),
              ),
              const SizedBox(height: 24),
              const Spacer(),
              CustomGestureDetectorContainer(
                text: 'Next',
                containerDecoration: kNextButtonBoxDecorationStyle,
                textStyle: kNextButtonTextStyle,
                textAlignment: Alignment.center,
                textPadding: const EdgeInsets.fromLTRB(15, 18.5, 15, 18.5),
                onTap: () {},
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?', style: kDefaultTextStyle),
                  TextButton(
                    onPressed: () {},
                    child: Text('Register', style: kRegisterTextStyle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
