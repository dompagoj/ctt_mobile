import 'package:ctt_mobile/app_config.dart';
import 'package:dio/dio.dart';


class Http {
  final AppConfig appConfig;
  Dio dio;

  Http(this.appConfig) {
    var options = BaseOptions(
      baseUrl: appConfig.apiUrl,
    );
    dio = Dio(options);
  }
}
