part of 'vessel_bloc.dart';

abstract class VesselEvent extends Equatable {
  const VesselEvent();
}

class VesselStarted extends VesselEvent {
  final String filter;
  final String? search;

  const VesselStarted({
    required this.filter,
    this.search,
  });

  @override
  List<Object?> get props => [
        filter,
        search,
      ];
}
