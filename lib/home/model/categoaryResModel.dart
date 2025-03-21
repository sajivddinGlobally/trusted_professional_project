// To parse this JSON data, do
//
//     final homeCategoryResModel = homeCategoryResModelFromJson(jsonString);

import 'dart:convert';

HomeCategoryResModel homeCategoryResModelFromJson(String str) => HomeCategoryResModel.fromJson(json.decode(str));

String homeCategoryResModelToJson(HomeCategoryResModel data) => json.encode(data.toJson());

class HomeCategoryResModel {
    String message;
    Data data;

    HomeCategoryResModel({
        required this.message,
        required this.data,
    });

    factory HomeCategoryResModel.fromJson(Map<String, dynamic> json) => HomeCategoryResModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String title;
    String imagePath;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.title,
        required this.imagePath,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        imagePath: json["image_path"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "image_path": imagePath,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
