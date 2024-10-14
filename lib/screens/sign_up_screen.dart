import 'package:auth_using_bloc/bloc/authentication_bloc.dart';
import 'package:auth_using_bloc/components/custom_app_bar.dart';
import 'package:auth_using_bloc/components/custom_gesture_detector_container.dart';
import 'package:auth_using_bloc/components/custom_text_input_field.dart';
import 'package:auth_using_bloc/components/password_eye.dart';
import 'package:auth_using_bloc/models/sign_up_req.dart';
import 'package:auth_using_bloc/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '/components/signup/signup_form.dart';

part '/components/signup/footer_section.dart';

part '/components/signup/input_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: _authStateListener,
      builder: (context, state) {
        return Scaffold(
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
              child: SignupInputForm(isLoading: state is AuthLoading,),
            ),
          ),
        );
      },
    );
  }

  void _authStateListener(BuildContext context, AuthenticationState state) {
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
  }
}
