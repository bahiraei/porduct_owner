part of 'vessel_bloc.dart';

abstract class VesselState extends Equatable {
  const VesselState();
}

class VesselInitial extends VesselState {
  @override
  List<Object> get props => [];
}

class VesselLoading extends VesselState {
  @override
  List<Object?> get props => [];
}

class VesselEmpty extends VesselState {
  @override
  List<Object?> get props => [];
}

class VesselSuccess extends VesselState {
  final List<Vessel> vesseles;

  const VesselSuccess({
    required this.vesseles,
  });

  @override
  List<Object?> get props => [vesseles];
}

class VesselError extends VesselState {
  final AppException exception;

  const VesselError({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}
