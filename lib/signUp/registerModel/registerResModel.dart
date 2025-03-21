// To parse this JSON data, do
//
//     final registorResModel = registorResModelFromJson(jsonString);

import 'dart:convert';

RegistorResModel registorResModelFromJson(String str) => RegistorResModel.fromJson(json.decode(str));

String registorResModelToJson(RegistorResModel data) => json.encode(data.toJson());

class RegistorResModel {
    User user;
    String token;

    RegistorResModel({
        required this.user,
        required this.token,
    });

    factory RegistorResModel.fromJson(Map<String, dynamic> json) => RegistorResModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}

class User {
    String name;
    String email;
    String phone;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    User({
        required this.name,
        required this.email,
        required this.phone,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
