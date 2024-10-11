import 'package:auth_using_bloc/bloc/authentication_bloc.dart';
import 'package:auth_using_bloc/components/custom_app_bar.dart';
import 'package:auth_using_bloc/components/custom_gesture_detector_container.dart';
import 'package:auth_using_bloc/components/custom_text_input_field.dart';
import 'package:auth_using_bloc/components/password_eye.dart';
import 'package:auth_using_bloc/models/sign_up_req.dart';
import 'package:auth_using_bloc/screens/home_screen.dart';
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
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

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
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is AuthAuthenticated) {
          // Only navigate when authenticated
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Sign Up',
          allowBackButton: true,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
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
                          obscureText: _obscurePasswordText,
                          textEditingController: passwordController,
                          trailingIcon: PasswordEye(
                            onTap: _togglePasswordView,
                          ),
                        ),
                        const SizedBox(height: 15),
                        CustomTextInputFieldWithIcon(
                          hintText: 'Confirm Password',
                          obscureText: _obscureConfirmPasswordText,
                          textEditingController: confirmPasswordController,
                          trailingIcon: PasswordEye(
                            onTap: _toggleConfirmPasswordView,
                          ),
                        ),
                        // const SizedBox(height: 15),
                        const Spacer(),
                        BlocBuilder<AuthenticationBloc, AuthenticationState>(
                          buildWhen: (previous, current) => true,
                          builder: (context, state) {
                            return GestureDetectorContainer(
                              isLoading: state is AuthLoading,
                              text: 'Sign Up',
                              onTap: () {
                                _handleSignUpButtonOnTap(context);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _handleSignUpButtonOnTap(BuildContext context) {
    context.read<AuthenticationBloc>().add(
          SignUpSubmissionEvent(
            signUpReq: SignUpReq(
              fullName: nameController.text,
              email: emailController.text,
              password: passwordController.text,
              confirmPassword: confirmPasswordController.text,
            ),
          ),
        );
  }

  void _togglePasswordView() {
    setState(() {
      _obscurePasswordText = !_obscurePasswordText;
    });
  }
  void _toggleConfirmPasswordView() {
    setState(() {
      _obscureConfirmPasswordText = !_obscureConfirmPasswordText;
    });
  }
}
