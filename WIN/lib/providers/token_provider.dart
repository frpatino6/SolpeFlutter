import 'dart:io' show Platform;

class PlatformProvider {
  static final PlatformProvider instance = PlatformProvider._();

  PlatformProvider._();

  String _token = "";

  String getPlatform() {
    if (Platform.isAndroid) {
      return "android";
    } else if (Platform.isIOS) {
      return "ios";
      // iOS-specific code
    }
    return "web";
  }
  set token(String _currentToken) {
    this._token = _currentToken;
  }
  String getToken() {
    return _token;
  }
}
