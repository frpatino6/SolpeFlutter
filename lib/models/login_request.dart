class LoginRequest {
  String userEmail;
  String userPassword;
  String accessToken;
  String platform;

  LoginRequest(
      {this.userEmail, this.userPassword, this.accessToken, this.platform});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    userEmail = json['userEmail'];
    userPassword = json['userPassword'];
    accessToken = json['accessToken'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userEmail'] = this.userEmail;
    data['userPassword'] = this.userPassword;
    data['accessToken'] = this.accessToken;
    data['platform'] = this.platform;
    return data;
  }
}
