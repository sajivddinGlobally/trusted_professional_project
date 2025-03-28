// To parse this JSON data, do
//
//     final registorBodyModel = registorBodyModelFromJson(jsonString);

import 'dart:convert';

RegistorBodyModel registorBodyModelFromJson(String str) => RegistorBodyModel.fromJson(json.decode(str));

String registorBodyModelToJson(RegistorBodyModel data) => json.encode(data.toJson());

class RegistorBodyModel {
    String name;
    String email;
    String password;
    String passwordConfirmation;
    String phone;
    String aadhar;
    String userType;

    RegistorBodyModel({
        required this.name,
        required this.email,
        required this.password,
        required this.passwordConfirmation,
        required this.phone,
        required this.aadhar,
        required this.userType,
    });

    factory RegistorBodyModel.fromJson(Map<String, dynamic> json) => RegistorBodyModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        phone: json["phone"],
        aadhar: json["aadhar"],
        userType: json["user_type"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "phone": phone,
        "aadhar": aadhar,
        "user_type": userType,
    };
}
