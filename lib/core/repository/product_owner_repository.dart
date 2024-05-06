import 'package:file_picker/file_picker.dart';
import 'package:porduct_owner/core/client/http_client.dart';
import 'package:porduct_owner/core/source/product_owner_data_source.dart';

import '../../features/services/data/response/allocation_equs_response.dart';
import '../response/allocation_equ_base_info.dart';
import '../response/ships.dart';

abstract class IProductOwnerRepository {
  Future<AllocationEquBaseInfoResponse> getAllocationEquBaseInfo();

  Future<void> createAllocationEqu({
    required String shipId,
    required String productId,
    required String pmoNumber,
    required String enterShipFa,
    required int tonnage,
    String? description,
    required String portId,
    required List<String> allocationOfEquTypeIds,
    PlatformFile? manifestFile,
  });

  Future<ShipsResponse> getShips({
    String? shipType,
    String? search,
  });

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

class ProductOwnerRepository implements IProductOwnerRepository {
  final IProductOwnerDataSource dataSource;

  ProductOwnerRepository({
    required this.dataSource,
  });

  @override
  Future<AllocationEquBaseInfoResponse> getAllocationEquBaseInfo() {
    return dataSource.getAllocationEquBaseInfo();
  }

  @override
  Future<void> createAllocationEqu({
    required String shipId,
    required String productId,
    required String pmoNumber,
    required String enterShipFa,
    required int tonnage,
    String? description,
    required String portId,
    required List<String> allocationOfEquTypeIds,
    PlatformFile? manifestFile,
  }) {
    return dataSource.createAllocationEqu(
      shipId: shipId,
      productId: productId,
      pmoNumber: pmoNumber,
      enterShipFa: enterShipFa,
      tonnage: tonnage,
      portId: portId,
      allocationOfEquTypeIds: allocationOfEquTypeIds,
      description: description,
      manifestFile: manifestFile,
    );
  }

  @override
  Future<ShipsResponse> getShips({
    String? shipType,
    String? search,
  }) {
    return dataSource.getShips(
      search: search,
      shipType: shipType,
    );
  }

  @override
  Future<AllocationEquResponse> getAllocationEqu({
    required int page,
    required String? shipId,
    required String? portId,
  }) {
    return dataSource.getAllocationEqu(
      page: page,
      portId: portId,
      shipId: shipId,
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

final productOwnerRepository = ProductOwnerRepository(
  dataSource: ProductOwnerDataSource(
    client: loadUnloadClient,
  ),
);
