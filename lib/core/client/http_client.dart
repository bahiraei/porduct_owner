import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../features/auth/data/repository/auth_repository.dart';
import '../consts/app_environment.dart';

import '../utils/helper.dart';

Dio loadUnloadClient = Dio(
  BaseOptions(
    baseUrl: AppEnvironment.transportationBaseUrl,
    connectTimeout: const Duration(seconds: 40),
  ),
)
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final authInfo = AuthRepository.tokenInfo;
        options.headers['Authorization'] = 'Bearer ${authInfo?.token}';
        options.headers['Accept'] = 'application/json';

        handler.next(options);
      },
    ),
  )
  ..interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: false,
      maxWidth: 90,
      logPrint: (object) {
        Helper.log(object.toString());
      },
    ),
  );
