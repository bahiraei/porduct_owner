import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../consts/app_environment.dart';

import '../utils/helper.dart';

Dio loadUnloadClient = Dio(
  BaseOptions(
    baseUrl: AppEnvironment.transportationBaseUrl,
    connectTimeout: const Duration(seconds: 40),
  ),
)..interceptors.add(
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
