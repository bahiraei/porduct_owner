import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/consts/app_environment.dart';
import '../../../../core/exception/http_response_validator.dart';
import '../response/allocation_equs_response.dart';

abstract class IPortServicesDataSource {
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

class PortServicesDataSource
    with HttpResponseValidator
    implements IPortServicesDataSource {
  final Dio http;

  PortServicesDataSource({
    required this.http,
  });

  @override
  Future<AllocationEquResponse> getAllocationEqu({
    required String pass,
    required int page,
    required String? search,
    required String? shipId,
    required String? portId,
    required String? companyId,
  }) async {
    final response = await http.post(
      '/api/OrganizationApp/GetAllocationEqu',
      data: {
        "page": page,
        "companyId": companyId,
        "portId": portId,
        "shipId": shipId,
        "search": search,
        "pass": AppEnvironment.loadUnloadApiPassword,
      },
    );

    final validated = validateResponse(response);

    return AllocationEquResponse.fromJson(validated.data);
  }

  @override
  Future<String?> getReportAllocationEquAriaBase64File({
    required String pass,
    required String allocationEquipmentId,
  }) async {
    final response = await http.post(
      '/api/OrganizationApp/GetReportAllocationEquAriaBase64File',
      data: {
        "allocationEquipmentId": allocationEquipmentId,
        "pass": AppEnvironment.loadUnloadApiPassword,
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
    required String pass,
    required String allocationEquipmentId,
  }) async {
    final response = await http.post(
      '/api/OrganizationApp/GetReportAllocationEquOrgBase64File',
      data: {
        "allocationEquipmentId": allocationEquipmentId,
        "pass": AppEnvironment.loadUnloadApiPassword,
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
