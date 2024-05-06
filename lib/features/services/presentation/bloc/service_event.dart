part of 'service_bloc.dart';

sealed class ServiceEvent extends Equatable {
  const ServiceEvent();
}

final class ServiceBaseInfoStarted extends ServiceEvent {
  @override
  List<Object?> get props => [];
}

final class ServiceShipsStarted extends ServiceEvent {
  final String? search;
  final String? shipType;

  const ServiceShipsStarted({
    this.search,
    this.shipType,
  });

  @override
  List<Object?> get props => [
        search,
        shipType,
      ];
}

final class ServiceAddUnloadRequestStarted extends ServiceEvent {
  final int tonnage;
  final String productId;
  final String pmoNumber;
  final String description;
  final String enterShipFa;
  final String portId;

  final String shipId;

  final List<String> allocationOfEquTypeIds;

  final PlatformFile? manifestFile;

  const ServiceAddUnloadRequestStarted({
    required this.tonnage,
    required this.productId,
    required this.pmoNumber,
    required this.description,
    required this.enterShipFa,
    required this.portId,
    required this.shipId,
    required this.allocationOfEquTypeIds,
    this.manifestFile,
  });

  @override
  List<Object?> get props => [
        tonnage,
        productId,
        pmoNumber,
        description,
        enterShipFa,
        portId,
        shipId,
        allocationOfEquTypeIds,
        manifestFile,
      ];
}

final class ServiceLoadUnloadRequestsStarted extends ServiceEvent {
  final bool isScrolling;

  const ServiceLoadUnloadRequestsStarted({
    required this.isScrolling,
  });

  @override
  List<Object?> get props => [
        isScrolling,
      ];
}

final class ServiceLoadUnloadRequestStarted extends ServiceEvent {
  final String allocationEquipmentId;

  const ServiceLoadUnloadRequestStarted({
    required this.allocationEquipmentId,
  });

  @override
  List<Object?> get props => [allocationEquipmentId];
}
