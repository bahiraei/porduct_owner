import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:porduct_owner/core/exception/http_response_validator.dart';

import '../../features/services/data/response/allocation_equs_response.dart';
import '../response/allocation_equ_base_info.dart';
import '../response/ships.dart';

abstract class IProductOwnerDataSource {
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
    required String productId,
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
        'productId': productId,
        'pmoNumber': pmoNumber,
        'enterShipFa': enterShipFa,
        'tonnage': tonnage,
        'description': description,
        'portId': portId,
        'AllocationOfEquTypeIds': allocationOfEquTypeIds,
      },
    );
    if (manifestFile != null) {
      formData = FormData.fromMap(
        {
          'manifestFile': MultipartFile.fromBytes(
            await manifestFile.xFile.readAsBytes(),
            filename: manifestFile.name,
          ),
          'shipId': shipId,
          'productId': productId,
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
      '/api/OwnerProduct/CreateAllocationEqu',
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
      data: {
        "shipType": shipType,
        "search": search,
      },
    );

    final validated = validateResponse(response);

    return ShipsResponse.fromJson(validated.data);
  }

  @override
  Future<AllocationEquResponse> getAllocationEqu({
    required int page,
    required String? shipId,
    required String? portId,
  }) async {
    final response = await client.post(
      '/api/OwnerProduct/GetAllocatinEqu',
      data: {
        "page": page,
        "portId": portId,
        "shipId": shipId,
      },
    );

    final validated = validateResponse(response);

    return AllocationEquResponse.fromJson(validated.data);
  }

  @override
  Future<String?> getReportAllocationEquAriaBase64File({
    required String allocationEquipmentId,
  }) async {
    final response = await client.post(
      '/api/OwnerProduct/GetReportAllocationEquAriaBase64File',
      data: {
        "data": allocationEquipmentId,
      },
    );

    final validated = validateResponse(response);

    try {
      json.decode(validated.data);
      return null;
    } on FormatException {
      return validated.data;
    }
  }

  @override
  Future<String?> getReportAllocationEquOrgBase64File({
    required String allocationEquipmentId,
  }) async {
    final response = await client.post(
      '/api/OwnerProduct/GetReportAllocationEquOrgBase64File',
      data: {
        "data": allocationEquipmentId,
      },
    );

    final validated = validateResponse(response);

    try {
      json.decode(validated.data);
      return null;
    } on FormatException {
      return validated.data;
    }
  }
}
