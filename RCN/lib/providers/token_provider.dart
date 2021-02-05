import 'dart:io' show Platform;

class PlatformProvider {
  static final PlatformProvider instance = PlatformProvider._();

  PlatformProvider._();
  String _token="asdasda";

  String getPlatform() {
    if (Platform.isAndroid) {
      return "android";
    } else if (Platform.isIOS) {
      return "ios";
      // iOS-specific code
    }
  }

  String getToken() {
    return _token;
  }
}
