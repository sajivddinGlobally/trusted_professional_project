// To parse this JSON data, do
//
//     final otpResModel = otpResModelFromJson(jsonString);

import 'dart:convert';

OtpResModel otpResModelFromJson(String str) => OtpResModel.fromJson(json.decode(str));

String otpResModelToJson(OtpResModel data) => json.encode(data.toJson());

class OtpResModel {
    String? message;
    String? token;
    User user;

    OtpResModel({
        required this.message,
        required this.token,
        required this.user,
    });

    factory OtpResModel.fromJson(Map<String, dynamic> json) => OtpResModel(
        message: json["message"],
        token: json["token"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "user": user.toJson(),
    };
}

class User {
    int id;
    String? name;
    String? email;
    String phone;
    dynamic emailVerifiedAt;
    String? token;
    dynamic rememberToken;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic image;
    dynamic video;
    dynamic userType;
    dynamic aadhar;
    dynamic service;
    String? otp;
    DateTime otpExpiresAt;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.emailVerifiedAt,
        required this.token,
        required this.rememberToken,
        required this.createdAt,
        required this.updatedAt,
        required this.image,
        required this.video,
        required this.userType,
        required this.aadhar,
        required this.service,
        required this.otp,
        required this.otpExpiresAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        token: json["token"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        video: json["video"],
        userType: json["user_type"],
        aadhar: json["aadhar"],
        service: json["service"],
        otp: json["otp"],
        otpExpiresAt: DateTime.parse(json["otp_expires_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "email_verified_at": emailVerifiedAt,
        "token": token,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
        "video": video,
        "user_type": userType,
        "aadhar": aadhar,
        "service": service,
        "otp": otp,
        "otp_expires_at": otpExpiresAt.toIso8601String(),
    };
}
