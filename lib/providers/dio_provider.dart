import 'package:dio/dio.dart';

class DioProvider {
  String urlSolpe = "https://solpe.rcntv.com.co:442";
  String urlDatabase = "https://solpe.rcntv.com.co:444";
  static final DioProvider instance = DioProvider._();

  DioProvider._();

  void setHeader(Dio dio) {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Access-Control-Allow-Origin'] = '*';
    dio.options.headers['Access-Control-Allow-Methods'] = 'GET, PUT, POST';
    dio.options.headers['X-TFS-FedAuthRedirect'] = 'Suppress';
  }
}
