import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/exception/http_response_validator.dart';
import '../response/allocation_equs_response.dart';

abstract class IPortServicesDataSource {
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

class PortServicesDataSource
    with HttpResponseValidator
    implements IPortServicesDataSource {
  final Dio http;

  PortServicesDataSource({
    required this.http,
  });

  @override
  Future<AllocationEquResponse> getAllocationEqu({
    required int page,
    required String? shipId,
    required String? portId,
  }) async {
    final response = await http.post(
      '/api/OwnerProduct/GetAllocationEqu',
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
    final response = await http.post(
      '/api/OwnerProduct/GetReportAllocationEquAriaBase64File',
      data: {
        "allocationEquipmentId": allocationEquipmentId,
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
    final response = await http.post(
      '/api/OwnerProduct/GetReportAllocationEquOrgBase64File',
      data: {
        "allocationEquipmentId": allocationEquipmentId,
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
