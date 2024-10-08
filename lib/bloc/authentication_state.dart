part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
}

final class AuthInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthenticationState {
  @override
  List<Object> get props => [];
}

final class AuthAuthenticated extends AuthenticationState {
  @override
  List<Object> get props => [];
}

final class AuthUnauthenticated extends AuthenticationState {
  @override
  List<Object> get props => [];
}

final class AuthError extends AuthenticationState {
  final String error;
  const AuthError({required this.error});
  @override
  List<Object> get props => [];
}
