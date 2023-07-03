part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final SystemUser? systemUser;
  final EkShebaUser? ekShebaUser;

  ///only one of [systemUser] or [ekShebaUser] will be non-null
  const AuthSuccess({this.systemUser, this.ekShebaUser});

  @override
  List<Object?> get props => [systemUser, ekShebaUser];
}

class AuthFailureState extends AuthState {
  final String message;

  const AuthFailureState({required this.message});

  @override
  List<Object> get props => [message];
}
