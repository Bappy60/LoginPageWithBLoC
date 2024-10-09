import 'package:auth_using_bloc/bloc/authentication_bloc.dart';
import 'package:auth_using_bloc/components/custom_app_bar.dart';
import 'package:auth_using_bloc/components/custom_gesture_detector_container.dart';
import 'package:auth_using_bloc/components/custom_text_input_field.dart';
import 'package:auth_using_bloc/components/forgot_password_button.dart';
import 'package:auth_using_bloc/components/password_eye.dart';
import 'package:auth_using_bloc/constants/consts.dart';
import 'package:auth_using_bloc/models/login_req.dart';
import 'package:auth_using_bloc/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController;
    _passwordController;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthError) {
          // Show a SnackBar or an AlertDialog to display the error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Login',
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
                          hintText: 'Email address',
                          textEditingController: _emailController,
                        ),
                        const SizedBox(height: 15),
                        CustomTextInputFieldWithIcon(
                          hintText: 'Password',
                          textEditingController: _passwordController,
                          trailingIcon: const PasswordEye(),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: ForgotPasswordButton(text: 'Forgot password?'),
                        ),
                        const SizedBox(height: 24),
                        const Spacer(),
                        BlocBuilder<AuthenticationBloc, AuthenticationState>(
                          builder: (context, state) {
                            return GestureDetectorContainer(
                              isLoading: state is AuthLoading,
                              text: 'Next',
                              onTap: () {
                                _handleNextButtonOnTap(context);
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?',
                                style: kDefaultTextStyle),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                                // context.read<AuthenticationBloc>().add(
                                //       const SignUpInitialEvent(),
                                //     );
                              },
                              child:
                                  Text('Register', style: kRegisterTextStyle),
                            ),
                          ],
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

  void _handleNextButtonOnTap(BuildContext context) {
    context.read<AuthenticationBloc>().add(
          LogInEvent(
            loginReq: LoginReq(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          ),
        );
  }
}
