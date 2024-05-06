import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:porduct_owner/core/exception/app_exception.dart';
import 'package:porduct_owner/core/response/allocation_equ_base_info.dart';

import '../../../../core/repository/product_owner_repository.dart';
import '../../../../core/response/ships.dart';
import '../../../../core/utils/routes.dart';
import '../../../auth/data/repository/auth_repository.dart';
import '../../data/model/allocation_equ.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final IProductOwnerRepository repository;
  final BuildContext context;

  bool moreData = true;
  int page = 0;

  List<AllocationEquModel> _history = [];

  bool isLoading = false;

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
            productId: event.productId,
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
      if (event is ServiceLoadUnloadRequestsStarted) {
        try {
          if (!event.isScrolling) {
            moreData = true;
          }
          if ((isLoading || moreData == false)) {
            return;
          } else {
            isLoading = true;
          }

          if (!event.isScrolling) {
            _history = [];
            page = 0;
            moreData = true;
            isLoading = false;

            emit(ServiceLoading());
          }

          final result = await repository.getAllocationEqu(
            page: page,
            shipId: null,
            portId: null,
          );

          page++;
          moreData = result.moreData;

          if (result.allocationEqus.isEmpty && _history.isNotEmpty) {
            page--;
            isLoading = false;

            emit(
              ServiceLoadUnloadRequestsSuccess(
                allocationEqus: _history,
                moreData: result.moreData,
              ),
            );
          } else if (result.allocationEqus.isEmpty && _history.isEmpty) {
            isLoading = false;
            emit(
              ServiceEmpty(),
            );
          } else {
            isLoading = false;
            _history = _history + result.allocationEqus;
            emit(
              ServiceLoadUnloadRequestsSuccess(
                allocationEqus: _history,
                moreData: result.moreData,
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
            isLoading = false;
            emit(ServiceError(exception: exception));
          }
        }
      } else if (event is ServiceLoadUnloadAriaInvoiceStarted) {
        try {
          emit(const ServiceLoadUnloadAriaInvoiceLoading());

          final aria = await repository.getReportAllocationEquAriaBase64File(
            allocationEquipmentId: event.allocationEquipmentId,
          );

          emit(ServiceLoadUnloadAriaInvoiceSuccess(
            ariaBase64:
                (aria?.isNotEmpty ?? false) ? base64Decode(aria!) : null,
          ));
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
            isLoading = false;
            emit(ServiceDialogError(exception: exception));
          }
        }
      } else if (event is ServiceLoadUnloadOrgInvoiceStarted) {
        try {
          emit(const ServiceLoadUnloadOrgInvoiceLoading());

          final org = await repository.getReportAllocationEquOrgBase64File(
            allocationEquipmentId: event.allocationEquipmentId,
          );

          emit(ServiceLoadUnloadOrgInvoiceSuccess(
            orgBase64: (org?.isNotEmpty ?? false) ? base64Decode(org!) : null,
          ));
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
            isLoading = false;
            emit(ServiceDialogError(exception: exception));
          }
        }
      }
    });
  }
}
