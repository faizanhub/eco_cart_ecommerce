class LoginResponse {
  String? message;
  int? statusCode;
  LoginData? data;

  LoginResponse({this.message, this.statusCode, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  int? id;
  String? email;
  String? phone;
  String? password;
  String? accessToken;

  LoginData({this.id, this.email, this.phone, this.password, this.accessToken});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['accessToken'] = accessToken;
    return data;
  }
}
