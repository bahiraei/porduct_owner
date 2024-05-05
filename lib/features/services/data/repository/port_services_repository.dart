import '../../../../core/client/http_client.dart';
import '../response/allocation_equs_response.dart';
import '../source/port_services_data_source.dart';

abstract class IPortServicesRepository {
  Future<AllocationEquResponse> getAllocationEqu({
    required String pass,
    required int page,
    required String? search,
    required String? shipId,
    required String? portId,
    required String? companyId,
  });

  Future<String?> getReportAllocationEquOrgBase64File({
    required String pass,
    required String allocationEquipmentId,
  });

  Future<String?> getReportAllocationEquAriaBase64File({
    required String pass,
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
    required String pass,
    required int page,
    required String? search,
    required String? shipId,
    required String? portId,
    required String? companyId,
  }) {
    return dataSource.getAllocationEqu(
      pass: pass,
      page: page,
      search: search,
      shipId: shipId,
      portId: portId,
      companyId: companyId,
    );
  }

  @override
  Future<String?> getReportAllocationEquAriaBase64File({
    required String pass,
    required String allocationEquipmentId,
  }) {
    return dataSource.getReportAllocationEquAriaBase64File(
      pass: pass,
      allocationEquipmentId: allocationEquipmentId,
    );
  }

  @override
  Future<String?> getReportAllocationEquOrgBase64File({
    required String pass,
    required String allocationEquipmentId,
  }) {
    return dataSource.getReportAllocationEquOrgBase64File(
      pass: pass,
      allocationEquipmentId: allocationEquipmentId,
    );
  }
}

final portServicesRepository = PortServicesRepository(
  dataSource: PortServicesDataSource(
    http: loadUnloadClient,
  ),
);