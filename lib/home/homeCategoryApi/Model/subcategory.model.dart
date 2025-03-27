// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) => SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) => json.encode(data.toJson());

class SubCategoryModel {
    String message;
    List<Datum> data;

    SubCategoryModel({
        required this.message,
        required this.data,
    });

    factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String categoryName;
    String title;
    String? imageUrl;
    DateTime createdAt;

    Datum({
        required this.id,
        required this.categoryName,
        required this.title,
        required this.imageUrl,
        required this.createdAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        categoryName: json["category_name"],
        title: json["title"],
        imageUrl: json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "title": title,
        "image_url": imageUrl,
        "created_at": createdAt.toIso8601String(),
    };
}
