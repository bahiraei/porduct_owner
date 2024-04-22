import 'package:dio/dio.dart';

import '../../../../core/exception/http_response_validator.dart';
import '../response/vesselles_model.dart';

abstract class IIMassDataSource {
  Future<VessellesResponse> getVesselles({
    required String password,
  });
}

class IIMassRemoteDataSource
    with HttpResponseValidator
    implements IIMassDataSource {
  final Dio http;

  IIMassRemoteDataSource({
    required this.http,
  });

  @override
  Future<VessellesResponse> getVesselles({
    required String password,
  }) async {
    final response = await http.post(
      'Map/GetVesselInfo',
      data: {
        'password': password,
      },
    );

    final validated = validateResponse(response);

    return VessellesResponse.fromJson(validated.data);
  }
}
