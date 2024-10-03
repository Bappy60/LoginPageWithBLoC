import 'package:auth_using_bloc/components/custom_app_bar.dart';
import 'package:auth_using_bloc/components/custom_gesture_detector_container.dart';
import 'package:auth_using_bloc/components/custom_icon_button.dart';
import 'package:auth_using_bloc/components/custom_text_input_field.dart';
import 'package:auth_using_bloc/components/forgot_password_button.dart';
import 'package:auth_using_bloc/components/password_eye.dart';
import 'package:auth_using_bloc/constants/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Login',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 55),
                const CustomTextInputFieldWithIcon(hintText: 'Email address'),
                const SizedBox(height: 15),
                const CustomTextInputFieldWithIcon(
                  hintText: 'Password',
                  trailingIcon: PasswordEye(),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: ForgotPasswordButton(text: 'Forgot password?'),
                ),
                const SizedBox(height: 24),
                // const Spacer(),
                GestureDetectorContainer(
                  text: 'Next',
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
      ),
    );
  }
}
