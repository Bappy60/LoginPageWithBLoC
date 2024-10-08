import 'package:auth_using_bloc/bloc/authentication_bloc.dart';
import 'package:auth_using_bloc/components/custom_app_bar.dart';
import 'package:auth_using_bloc/components/custom_gesture_detector_container.dart';
import 'package:auth_using_bloc/components/custom_text_input_field.dart';
import 'package:auth_using_bloc/components/password_eye.dart';
import 'package:auth_using_bloc/models/sign_up_req.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Sign Up',
          allowBackButton: true,
          onBackButtonPressed: () {
            Navigator.pop(context);
          }),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 55),
                      CustomTextInputFieldWithIcon(
                        hintText: 'Full Name',
                        textEditingController: nameController,
                      ),
                      const SizedBox(height: 15),
                      CustomTextInputFieldWithIcon(
                        hintText: 'Email address',
                        textEditingController: emailController,
                      ),
                      const SizedBox(height: 15),
                      CustomTextInputFieldWithIcon(
                        hintText: 'Password',
                        textEditingController: passwordController,
                        trailingIcon: const PasswordEye(),
                      ),
                      const SizedBox(height: 15),
                      CustomTextInputFieldWithIcon(
                        hintText: 'Confirm Password',
                        textEditingController: confirmPasswordController,
                        trailingIcon: const PasswordEye(),
                      ),
                      const SizedBox(height: 15),
                      const Spacer(),
                      BlocListener<AuthenticationBloc, AuthenticationState>(
                        listener: (context, state) {
                          isLoading = state is AuthLoading;
                        },
                        child: GestureDetectorContainer(
                          isLoading: isLoading,
                          text: 'Sign Up',
                          onTap: () {
                            _handleSignUpButtonOnTap(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleSignUpButtonOnTap(BuildContext context) {
    context.read<AuthenticationBloc>().add(
          SignUpEvent(
            signUpReq: SignUpReq(
              fullName: nameController.text,
              email: emailController.text,
              password: passwordController.text,
              confirmPassword: confirmPasswordController.text,
            ),
          ),
        );
  }
}
