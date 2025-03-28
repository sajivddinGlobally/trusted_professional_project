// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) =>
    LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
  String message;
  Data data;

  LoginResModel({required this.message, required this.data});

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {"message": message, "data": data.toJson()};
}

class Data {
  int userid;
  String name;
  String email;
  String userType;
  String token;

  Data({
    required this.name,
    required this.userid,
    required this.userType,
    required this.email,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userid: json["user_id"],
    name: json["name"],
    userType: json["user_type"],
    email: json["email"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userid,
    "name": name,
    "user_type": userType,
    "email": email,
    "token": token,
  };
}
