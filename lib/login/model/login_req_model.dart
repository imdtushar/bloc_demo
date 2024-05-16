/// username : "kminchelle"
/// password : "0lelplR"
library;

class LoginReqModel {
  LoginReqModel({
    this.username,
    this.password,
  });

  LoginReqModel.fromJson(dynamic json) {
    username = json['username'];
    password = json['password'];
  }

  String? username;
  String? password;

  LoginReqModel copyWith({
    String? username,
    String? password,
  }) =>
      LoginReqModel(
        username: username ?? this.username,
        password: password ?? this.password,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    return map;
  }
}
