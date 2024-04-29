import 'package:dio/dio.dart';

import '../../../../core/exception/http_response_validator.dart';
import '../enum/device_type_enum.dart';
import '../model/account_info.dart';
import '../response/confirm_pass_response.dart';

abstract class IAuthDataSource {
  Future<ConfirmPassResponse> confirmByPass({
    required String username,
    required String password,
    required int osType,
    required String serial,
    required int appVersion,
  });

  Future<AccountInfo> login({
    required String securityKey,
    required DeviceTypeEnum deviceType,
    required int appVersion,
    String? imei,
  });

  Future<bool> isLogin();
}

class AuthDataSource with HttpResponseValidator implements IAuthDataSource {
  final Dio http;

  AuthDataSource({
    required this.http,
  });

  @override
  Future<ConfirmPassResponse> confirmByPass({
    required String username,
    required String password,
    required int osType,
    required String serial,
    required int appVersion,
  }) async {
    final response = await http.post(
      '/api/Account/ConfirmByPass',
      data: {
        "meliCode": username,
        "pass": password,
        "osType": osType,
        "seriall": serial,
        "appVersion": appVersion,
      },
    );

    return ConfirmPassResponse.fromJson(response.data);
  }

  @override
  Future<AccountInfo> login({
    required String securityKey,
    required deviceType,
    required int appVersion,
    String? imei,
  }) async {
    final response = await http.post(
      '/api/Account/Login',
      data: {
        "securityKey": securityKey,
        "deviceType": deviceType.index + 1,
        "appVersion": appVersion,
        "imei": imei
      },
    );

    return AccountInfo.fromJson(response.data);
  }

  @override
  Future<bool> isLogin() async {
    try {
      await http.post(
        '/api/OwnerProduct/GetAllocationEquBaseInfo',
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
