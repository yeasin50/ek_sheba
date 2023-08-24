import 'dart:async';

import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/ek_sheba_user.dart';
import '../../domain/entities/system_user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../../../common/utils/token_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
  }

  FutureOr<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    switch (event.authType) {
      case AuthType.ekSheba:
        final result = await _authRepository.ekShebaLogin(email: event.email, password: event.password);
        result.fold(
          (failure) => emit(const AuthFailureState(message: "Failed to login")),
          (user) async {
            emit(AuthSuccess(ekShebaUser: user));
            await TokenManager.setToken(user.token);
          },
        );

        break;

      case AuthType.system:
        final result = await _authRepository.systemLogin(
          email: event.email,
          password: event.password,
        );
        result.fold(
          (failure) => emit(
            const AuthFailureState(message: "Failed to login"),
          ),
          (user) async {
            emit(AuthSuccess(systemUser: user));
            await TokenManager.setToken(user.accessToken);
          },
        );
        break;
    }
  }
}
