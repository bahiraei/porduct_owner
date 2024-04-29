import 'package:porduct_owner/core/client/http_client.dart';
import 'package:porduct_owner/features/auth/data/repository/storage_repository.dart';

import '../../../../core/consts/app_key.dart';
import '../enum/device_type_enum.dart';
import '../model/account_info.dart';
import '../model/token_info.dart';
import '../response/confirm_pass_response.dart';
import '../source/auth_data_source.dart';

abstract class IAuthRepository {
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

  Future<void> signOut();
}

class AuthRepository implements IAuthRepository {
  final IAuthDataSource dataSource;
  final IStorageRepository secureStorageRepository;

  static TokenInfo? tokenInfo;
  static AccountInfo? accountInfo;

  AuthRepository({
    required this.dataSource,
    required this.secureStorageRepository,
  });

  @override
  Future<ConfirmPassResponse> confirmByPass({
    required String username,
    required String password,
    required int osType,
    required String serial,
    required int appVersion,
  }) {
    return dataSource.confirmByPass(
      username: username,
      password: password,
      osType: osType,
      serial: serial,
      appVersion: appVersion,
    );
  }

  @override
  Future<AccountInfo> login({
    required String securityKey,
    required deviceType,
    required int appVersion,
    String? imei,
  }) async {
    final account = await dataSource.login(
      securityKey: securityKey,
      deviceType: deviceType,
      appVersion: appVersion,
      imei: '',
    );

    if (account.isSuccess) {
      if (account.token != null && account.securityKey != null) {
        await persistAuthTokens(account);
      }
    }

    return account;
  }

  Future<void> persistAuthTokens(
    AccountInfo authInfo,
  ) async {
    await secureStorageRepository.write(
      AppKey.STORAGE_ACCESS_TOKEN_KEY,
      authInfo.token!,
    );

    await secureStorageRepository.write(
      AppKey.STORAGE_SECURITY_KEY,
      authInfo.securityKey!,
    );

    await loadAuthInfo();
  }

  Future<void> loadAuthInfo() async {
    final String accessToken =
        await secureStorageRepository.read(AppKey.STORAGE_ACCESS_TOKEN_KEY) ??
            '';

    final String securityKey =
        await secureStorageRepository.read(AppKey.STORAGE_SECURITY_KEY) ?? '';

    if (accessToken != '' && securityKey != '') {
      tokenInfo = TokenInfo(
        token: accessToken,
        securityToken: securityKey,
      );
    }
  }

  @override
  Future<bool> isLogin() async {
    try {
      await authRepository.loadAuthInfo();
      final String? accessToken =
          await secureStorageRepository.read(AppKey.STORAGE_ACCESS_TOKEN_KEY);

      final String? securityKey =
          await secureStorageRepository.read(AppKey.STORAGE_SECURITY_KEY);

      if (tokenInfo != null && accessToken != null && securityKey != null) {
        final bool result = await dataSource.isLogin();
        if (result == false) {
          await authRepository.signOut();
        }
        return result;
      } else {
        return false;
      }
    } catch (e) {
      await authRepository.signOut();
      return false;
    }
  }

  @override
  Future<void> signOut() async {
    tokenInfo = null;

    await secureStorageRepository.delete(AppKey.STORAGE_ACCESS_TOKEN_KEY);
    await secureStorageRepository.delete(AppKey.STORAGE_SECURITY_KEY);
  }
}

final authRepository = AuthRepository(
  dataSource: AuthDataSource(
    http: loadUnloadClient,
  ),
  secureStorageRepository: secureStorageRepository,
);
