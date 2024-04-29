import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:porduct_owner/core/exception/http_response_validator.dart';

import '../response/allocation_equ_base_info.dart';
import '../response/ships.dart';

abstract class IProductOwnerDataSource {
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

class ProductOwnerDataSource
    with HttpResponseValidator
    implements IProductOwnerDataSource {
  final Dio client;

  ProductOwnerDataSource({
    required this.client,
  });

  @override
  Future<AllocationEquBaseInfoResponse> getAllocationEquBaseInfo() async {
    final response = await client.post(
      '/api/OwnerProduct/GetAllocationEquBaseInfo',
    );

    final validated = validateResponse(response);

    return AllocationEquBaseInfoResponse.fromJson(
      validated.data,
    );
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
  }) async {
    FormData formData = FormData.fromMap(
      {
        'shipId': shipId,
        'productCategoryId': productCategoryId,
        'pmoNumber': pmoNumber,
        'enterShipFa': enterShipFa,
        'tonnage': tonnage,
        'description': description,
        'portId': portId,
        'AllocationOfEquTypeIds': allocationOfEquTypeIds,
      },
    );
    if (manifestFile != null && manifestFile.bytes != null) {
      formData = FormData.fromMap(
        {
          'manifestFile': MultipartFile.fromBytes(
            manifestFile!.bytes!,
            filename: manifestFile.name,
          ),
          'shipId': shipId,
          'productCategoryId': productCategoryId,
          'pmoNumber': pmoNumber,
          'enterShipFa': enterShipFa,
          'tonnage': tonnage,
          'description': description,
          'portId': portId,
          'AllocationOfEquTypeIds': allocationOfEquTypeIds,
        },
      );
    }

    final Response response = await client.post(
      '/api/Account/ChangeProfileImage',
      data: formData,
    );

    validateResponse(response);
  }

  @override
  Future<ShipsResponse> getShips({
    String? shipType,
    String? search,
  }) async {
    final response = await client.post(
      '/api/Ship/GetShips',
    );

    final validated = validateResponse(response);

    return ShipsResponse.fromJson(validated.data);
  }
}
