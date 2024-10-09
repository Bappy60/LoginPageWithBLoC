import 'package:auth_using_bloc/bloc/validator.dart';
import 'package:auth_using_bloc/models/login_req.dart';
import 'package:auth_using_bloc/models/sign_up_req.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with Validator {
  AuthenticationBloc() : super(AuthInitial()) {
    on<AuthenticationInitialEvent>(_onInitialLoading);
    on<LogInEvent>(_onLogin);
    on<SignUpSubmissionEvent>(_onSignUp);
    on<LogOutEvent>(_onLogOut);
  }

  Future<void> _onLogin(
      LogInEvent event, Emitter<AuthenticationState> emit) async {
    final emailError = validateEmail(event.loginReq.email);
    final passwordError = validatePassword(event.loginReq.password);

    if (emailError != null || passwordError != null) {
      emit(const AuthError(error: 'Invalid login credentials'));
      return;
    }

    emit(AuthLoading());
    try {
      if (event.loginReq.email == 'rafid@gmail.com' &&
          event.loginReq.password == '12345678') {
        emit(const AuthError(error: 'User named Rafid is banned from the app!'));
      }
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthAuthenticated());
    } catch (e) {
      emit(const AuthError(error: 'Login failed'));
    }
  }

  Future<void> _onSignUp(
      SignUpSubmissionEvent event, Emitter<AuthenticationState> emit) async {
    final emailError = validateEmail(event.signUpReq.email);
    final passwordError = validatePassword(event.signUpReq.password);
    final confirmPasswordError = validateConfirmPassword(
        event.signUpReq.confirmPassword, event.signUpReq.password);
    final nameError = validateName(event.signUpReq.fullName);

    if (emailError != null ||
        passwordError != null ||
        confirmPasswordError != null ||
        nameError != null) {
      emit(const AuthError(error: 'Invalid sign-up credentials'));
      return;
    }

    emit(AuthLoading());

    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthAuthenticated());
    } catch (e) {
      emit(AuthError(error: 'Signup failed: ${e.toString()}'));
    }
  }

  void _onLogOut(LogOutEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthUnauthenticated());
  }

  void _onInitialLoading(
      AuthenticationInitialEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthUnauthenticated());
  }
}
