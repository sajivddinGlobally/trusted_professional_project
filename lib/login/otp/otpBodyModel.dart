// To parse this JSON data, do
//
//     final otpBodyModel = otpBodyModelFromJson(jsonString);

import 'dart:convert';

OtpBodyModel otpBodyModelFromJson(String str) => OtpBodyModel.fromJson(json.decode(str));

String otpBodyModelToJson(OtpBodyModel data) => json.encode(data.toJson());

class OtpBodyModel {
    String phone;
    String otp;

    OtpBodyModel({
        required this.phone,
        required this.otp,
    });

    factory OtpBodyModel.fromJson(Map<String, dynamic> json) => OtpBodyModel(
        phone: json["phone"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "otp": otp,
    };
}
