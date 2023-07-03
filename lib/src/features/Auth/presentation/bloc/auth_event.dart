part of 'auth_bloc.dart';

enum AuthType { ekSheba, system }

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({
    required this.email,
    required this.password,
    required this.authType,
    required this.rememberMe,
  });

  final String email;
  final String password;
  final AuthType authType;
  final bool rememberMe;

  @override
  List<Object> get props => [email, password, authType];
}
