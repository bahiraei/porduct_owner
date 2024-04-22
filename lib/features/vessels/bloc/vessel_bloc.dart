// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/consts/app_environment.dart';
import '../../../core/exception/app_exception.dart';
import '../data/model/vessel.dart';
import '../data/repository/imass_repository.dart';

part 'vessel_event.dart';
part 'vessel_state.dart';

class VesselBloc extends Bloc<VesselEvent, VesselState> {
  final IIMassRepository repository;

  VesselBloc({
    required this.repository,
  }) : super(VesselInitial()) {
    on<VesselEvent>((event, emit) async {
      if (event is VesselStarted) {
        try {
          emit((VesselLoading()));

          final result = await repository.getVesselles(
            password: AppEnvironment.loadUnloadApiPassword,
          );

          if (result.vesseles.isEmpty) {
            emit(VesselEmpty());
          } else {
            String iMassPortId = '';
            if (event.filter == 'انزلی') {
              iMassPortId =
                  "4FA92F80-CD40-4819-ADAB-92A113B037A5".toLowerCase();
            } else if (event.filter == 'رجایی') {
              iMassPortId =
                  "c725b741-5672-416f-bdb2-9a38cc020936".toLowerCase();
            }
            final filteredVesseles = result.vesseles
                .where((element) =>
                    element.mooringPortId == iMassPortId &&
                    element.mooringPortId != null)
                .toList();

            final searched = filteredVesseles
                .where(
                  (element) =>
                      element.name.contains(event.search ?? '') ||
                      element.type.contains(event.search ?? '') ||
                      (element.lastLocationPersianName ?? '')
                          .contains(event.search ?? ''),
                )
                .toList();

            if (searched.isNotEmpty) {
              emit(
                VesselSuccess(
                  vesseles: searched,
                ),
              );
            } else {
              emit(VesselEmpty());
            }
          }
        } catch (e) {
          final exception = await ExceptionHandler.handleDioError(e);

          emit(VesselError(exception: exception));
        }
      }
    });
  }
}
