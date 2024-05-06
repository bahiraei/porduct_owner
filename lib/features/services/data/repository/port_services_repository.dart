import '../../../../core/client/http_client.dart';
import '../response/allocation_equs_response.dart';
import '../source/port_services_data_source.dart';

abstract class IPortServicesRepository {
  Future<AllocationEquResponse> getAllocationEqu({
    required int page,
    required String? shipId,
    required String? portId,
  });

  Future<String?> getReportAllocationEquOrgBase64File({
    required String allocationEquipmentId,
  });

  Future<String?> getReportAllocationEquAriaBase64File({
    required String allocationEquipmentId,
  });
}

class PortServicesRepository implements IPortServicesRepository {
  final IPortServicesDataSource dataSource;

  PortServicesRepository({
    required this.dataSource,
  });

  @override
  Future<AllocationEquResponse> getAllocationEqu({
    required int page,
    required String? shipId,
    required String? portId,
  }) {
    return dataSource.getAllocationEqu(
      page: page,
      shipId: shipId,
      portId: portId,
    );
  }

  @override
  Future<String?> getReportAllocationEquAriaBase64File({
    required String allocationEquipmentId,
  }) {
    return dataSource.getReportAllocationEquAriaBase64File(
      allocationEquipmentId: allocationEquipmentId,
    );
  }

  @override
  Future<String?> getReportAllocationEquOrgBase64File({
    required String allocationEquipmentId,
  }) {
    return dataSource.getReportAllocationEquOrgBase64File(
      allocationEquipmentId: allocationEquipmentId,
    );
  }
}

final portServicesRepository = PortServicesRepository(
  dataSource: PortServicesDataSource(
    http: loadUnloadClient,
  ),
);
