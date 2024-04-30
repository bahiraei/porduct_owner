import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:porduct_owner/core/exception/app_exception.dart';
import 'package:porduct_owner/core/response/allocation_equ_base_info.dart';

import '../../../core/repository/product_owner_repository.dart';
import '../../../core/response/ships.dart';
import '../../../core/utils/routes.dart';
import '../../auth/data/repository/auth_repository.dart';

part 'service_event.dart';

part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final IProductOwnerRepository repository;
  final BuildContext context;

  ServiceBloc({
    required this.repository,
    required this.context,
  }) : super(ServiceInitial()) {
    on<ServiceEvent>((event, emit) async {
      if (event is ServiceBaseInfoStarted) {
        try {
          emit(ServiceLoading());

          final result = await repository.getAllocationEquBaseInfo();

          emit(ServiceBaseInfoSuccess(response: result));
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
            emit(ServiceError(exception: exception));
          }
        }
      } else if (event is ServiceShipsStarted) {
        try {
          emit(ServiceLoading());

          final result = await repository.getShips(
            search: event.search,
            shipType: event.shipType,
          );

          emit(ServiceShipsSuccess(response: result));
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
            emit(ServiceError(exception: exception));
          }
        }
      } else if (event is ServiceAddUnloadRequestStarted) {
        try {
          emit(ServiceLoading());

          await repository.createAllocationEqu(
            enterShipFa: event.enterShipFa,
            pmoNumber: event.pmoNumber,
            portId: event.portId,
            shipId: event.shipId,
            tonnage: event.tonnage,
            allocationOfEquTypeIds: event.allocationOfEquTypeIds,
            productCategoryId: event.productCategoryId,
            description: event.description,
            manifestFile: event.manifestFile,
          );

          emit(const ServiceAddUnloadRequestSuccess());
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
            emit(ServiceError(exception: exception));
          }
        }
      }
    });
  }
}
