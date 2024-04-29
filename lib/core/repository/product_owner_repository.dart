import 'package:file_picker/file_picker.dart';
import 'package:porduct_owner/core/client/http_client.dart';
import 'package:porduct_owner/core/source/product_owner_data_source.dart';

import '../response/allocation_equ_base_info.dart';
import '../response/ships.dart';

abstract class IProductOwnerRepository {
  Future<AllocationEquBaseInfoResponse> getAllocationEquBaseInfo();

  Future<void> createAllocationEqu({
    required String shipId,
    required String productCategoryId,
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
    required String productCategoryId,
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
      productCategoryId: productCategoryId,
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
}

final productOwnerRepository = ProductOwnerRepository(
  dataSource: ProductOwnerDataSource(
    client: loadUnloadClient,
  ),
);
