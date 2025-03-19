// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
    String message;
    Data data;

    LoginResModel({
        required this.message,
        required this.data,
    });

    factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String email;
    String token;

    Data({
        required this.email,
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "token": token,
    };
}
