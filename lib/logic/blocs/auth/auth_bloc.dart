import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      emit(AuthLoading());
      try {
        final userId = await authRepository.getUserId();
        if (userId != null) {
          emit(AuthAuthenticated(userId));
        } else {
          emit(AuthInitial());
        }
      } catch (e) {
        emit(AuthError("Failed to check auth status"));
      }
    });

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final userId = await authRepository.login(event.email, event.password);
        debugPrint('userIduserId$userId');
        emit(AuthAuthenticated(userId));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<LogoutRequested>((event, emit) async {
      await authRepository.logout();
      emit(AuthInitial());
    });
  }
}
