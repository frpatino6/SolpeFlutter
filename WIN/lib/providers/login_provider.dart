import 'package:dio/dio.dart';
import 'package:solpe_win/models/login_request.dart';

import 'dio_provider.dart';

class LoginProvider {
  static final LoginProvider instance = LoginProvider._();

  String? userEmail;

  LoginProvider._();

  Future<bool> fetchLogin(LoginRequest requestLogin) async {
    try {
      var dio = Dio();
      Response response;

      String url = DioProvider.instance.urlSolpe +
          '/login/ValidateUser/${requestLogin.userEmail}/empty/${requestLogin.accessToken}/${requestLogin.platform}';

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Access-Control-Allow-Origin'] = '*';
      dio.options.headers['Access-Control-Allow-Methods'] = 'GET, PUT, POST';
      dio.options.headers['X-TFS-FedAuthRedirect'] = 'Suppress';
      dio.options.headers['SolpePassword'] = requestLogin.userPassword;
      response = await dio.get(url);
      userEmail = requestLogin.userEmail;
      return _processResponse(response);
    } on DioError catch (e) {
      throw (e.response!.data);
    }
  }

  bool _processResponse(Response response) {
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
