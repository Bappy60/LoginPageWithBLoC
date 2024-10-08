import 'package:auth_using_bloc/models/login_req.dart';
import 'package:auth_using_bloc/models/sign_up_req.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthInitial()) {
    on<AuthenticationInitialEvent>(_onInitialLoading);
    on<LogInEvent>(_onLogin);
    on<SignUpEvent>(_onSignUp);
    on<LogOutEvent>(_onLogOut);
  }

  Future<void> _onLogin(
      LogInEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthLoading());
    try {
      if (event.loginReq.email == 'rafid' &&
          event.loginReq.password == '12345678') {
        emit(AuthUnauthenticated());
      }
      await Future.delayed(const Duration(seconds: 2));
      emit(AuthAuthenticated());
    } catch (e) {
      emit(const AuthError(error: 'Login failed'));
    }
  }

  Future<void> _onSignUp(
      SignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(AuthAuthenticated());
    } catch (e) {
      emit(const AuthError(error: 'Signup failed'));
    }
  }

  void _onLogOut(LogOutEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthInitial());
  }

  void _onInitialLoading(
      AuthenticationInitialEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthUnauthenticated());
  }
}
