// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:porduct_owner/core/repository/product_owner_repository.dart';

import '../../../../core/exception/app_exception.dart';

import '../../../../core/utils/helper.dart';
import '../../../../core/utils/routes.dart';

import '../../../auth/data/repository/auth_repository.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final IAuthRepository authRepository;
  final IProductOwnerRepository productOwnerRepository;
  final BuildContext context;

  SplashBloc({
    required this.authRepository,
    required this.productOwnerRepository,
    required this.context,
  }) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      if (event is SplashStarted) {
        try {
          emit(SplashLoading());

          final bool isLogin = await authRepository.isLogin();

          await Future.delayed(const Duration(seconds: 3));

          if (isLogin) {
            final result =
                await productOwnerRepository.getAllocationEquBaseInfo();
            emit(
              const SplashSuccess(),
            );
          } else {
            await Future.delayed(const Duration(seconds: 5));
            emit(
              SplashError(
                exception: UnauthorizedException(),
              ),
            );
          }
        } catch (e) {
          final exception = await ExceptionHandler.handleDioError(e);
          if (exception is UnauthorizedException) {
            await authRepository.signOut().then((value) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.splash,
                (route) => false,
              );
            });
          } else {
            emit(SplashError(exception: exception));
          }
        }
      }
    });
  }
}
