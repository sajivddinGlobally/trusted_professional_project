// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
    String message;
    int expiresIn;
    int otp;

    LoginResModel({
        required this.message,
        required this.expiresIn,
        required this.otp,
    });

    factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        message: json["message"],
        expiresIn: json["expires_in"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "expires_in": expiresIn,
        "otp": otp,
    };
}
