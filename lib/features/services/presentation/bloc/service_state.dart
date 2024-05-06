part of 'service_bloc.dart';

sealed class ServiceState extends Equatable {
  const ServiceState();
}

final class ServiceInitial extends ServiceState {
  @override
  List<Object> get props => [];
}

final class ServiceLoading extends ServiceState {
  @override
  List<Object?> get props => [];
}

final class ServiceError extends ServiceState {
  final AppException exception;

  const ServiceError({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}

final class ServiceEmpty extends ServiceState {
  @override
  List<Object?> get props => [];
}

final class ServiceBaseInfoSuccess extends ServiceState {
  final AllocationEquBaseInfoResponse response;

  const ServiceBaseInfoSuccess({
    required this.response,
  });

  @override
  List<Object?> get props => [response];
}

final class ServiceShipsSuccess extends ServiceState {
  final ShipsResponse response;

  const ServiceShipsSuccess({
    required this.response,
  });

  @override
  List<Object?> get props => [response];
}

final class ServiceAddUnloadRequestSuccess extends ServiceState {
  const ServiceAddUnloadRequestSuccess();

  @override
  List<Object?> get props => [];
}

final class ServiceLoadUnloadRequestsSuccess extends ServiceState {
  final List<AllocationEquModel> allocationEqus;
  final bool moreData;

  const ServiceLoadUnloadRequestsSuccess({
    required this.allocationEqus,
    required this.moreData,
  });
  @override
  List<Object> get props => [
        allocationEqus,
        moreData,
      ];
}

final class ServiceDialogError extends ServiceState {
  final AppException exception;

  const ServiceDialogError({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}

final class ServiceLoadUnloadAriaInvoiceLoading extends ServiceState {
  const ServiceLoadUnloadAriaInvoiceLoading();
  @override
  List<Object> get props => [];
}

final class ServiceLoadUnloadOrgInvoiceLoading extends ServiceState {
  const ServiceLoadUnloadOrgInvoiceLoading();
  @override
  List<Object> get props => [];
}

final class ServiceLoadUnloadAriaInvoiceSuccess extends ServiceState {
  final Uint8List? ariaBase64;

  const ServiceLoadUnloadAriaInvoiceSuccess({
    this.ariaBase64,
  });
  @override
  List<Object> get props => [];
}

final class ServiceLoadUnloadOrgInvoiceSuccess extends ServiceState {
  final Uint8List? orgBase64;

  const ServiceLoadUnloadOrgInvoiceSuccess({
    this.orgBase64,
  });
  @override
  List<Object> get props => [];
}
