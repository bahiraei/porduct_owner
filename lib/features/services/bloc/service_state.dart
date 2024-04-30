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
