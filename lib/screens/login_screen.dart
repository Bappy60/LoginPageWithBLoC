import 'package:auth_using_bloc/bloc/authentication_bloc.dart';
import 'package:auth_using_bloc/components/custom_app_bar.dart';
import 'package:auth_using_bloc/components/custom_gesture_detector_container.dart';
import 'package:auth_using_bloc/components/custom_text_input_field.dart';
import 'package:auth_using_bloc/components/login/forgot_password_button.dart';
import 'package:auth_using_bloc/components/password_eye.dart';
import 'package:auth_using_bloc/constants/consts.dart';
import 'package:auth_using_bloc/models/login_req.dart';
import 'package:auth_using_bloc/screens/home_screen.dart';
import 'package:auth_using_bloc/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../components/login/login_form.dart';
part '../components/login/register_section.dart';
part '../components/login/input_section.dart';
part '../components/login/submission_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: _authStateListener,
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(title: 'Login'),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: LoginForm(isLoading: state is AuthLoading),
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }
}



