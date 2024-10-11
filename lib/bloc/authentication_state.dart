part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
}

final class AuthInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

final class SignUpInitial extends AuthenticationState {
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

class AuthError extends AuthenticationState with EquatableMixin {
  final String error;
  final String id;

  AuthError({required this.error}) : id = const Uuid().v4();

  @override
  List<Object?> get props => [id, error];
}
