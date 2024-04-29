import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:porduct_owner/core/exception/app_exception.dart';
import 'package:porduct_owner/features/auth/data/enum/device_type_enum.dart';

import '../../data/repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  final BuildContext context;

  AuthBloc({
    required this.authRepository,
    required this.context,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthLoginWithPassStarted) {
        try {
          emit(AuthLoading());
          final confirmPass = await authRepository.confirmByPass(
            username: event.username,
            password: event.password,
            osType: 1,
            serial: '',
            appVersion: 100,
          );

          if (confirmPass.isSuccess && confirmPass.securityKey != null) {
            final account = await authRepository.login(
              securityKey: confirmPass.securityKey!,
              deviceType: DeviceTypeEnum.android,
              appVersion: 100,
            );
            if (account.isSuccess && account.token != null) {
              emit(AuthSuccess());
            } else {
              emit(AuthError(exception: UnauthorizedException()));
            }
          } else {
            emit(AuthError(exception: UnauthorizedException()));
          }
        } catch (e) {
          final exception = await ExceptionHandler.handleDioError(e);
          emit(AuthError(exception: exception));
        }
      }
    });
  }
}
