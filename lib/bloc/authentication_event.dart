part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class LogInEvent extends AuthenticationEvent {
  final LoginReq loginReq;

  const LogInEvent({required this.loginReq});

  @override
  List<Object> get props => [];
}

class SignUpSubmissionEvent extends AuthenticationEvent {
  final SignUpReq signUpReq;

  const SignUpSubmissionEvent({required this.signUpReq});

  @override
  List<Object> get props => [];
}

class LogOutEvent extends AuthenticationEvent {
  const LogOutEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialEvent extends AuthenticationEvent {
  const AuthenticationInitialEvent();

  @override
  List<Object?> get props =>[];
}

// class SignUpInitialEvent extends AuthenticationEvent {
//   const SignUpInitialEvent();
//
//   @override
//   List<Object?> get props =>[];
// }
