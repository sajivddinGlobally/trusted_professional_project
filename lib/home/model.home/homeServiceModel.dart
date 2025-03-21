// To parse this JSON data, do
//
//     final homeServiceModel = homeServiceModelFromJson(jsonString);

import 'dart:convert';

HomeServiceModel homeServiceModelFromJson(String str) => HomeServiceModel.fromJson(json.decode(str));

String homeServiceModelToJson(HomeServiceModel data) => json.encode(data.toJson());

class HomeServiceModel {
    String message;
    List<Datum> data;

    HomeServiceModel({
        required this.message,
        required this.data,
    });

    factory HomeServiceModel.fromJson(Map<String, dynamic> json) => HomeServiceModel(
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
    String title;
    String description;
    String imageUrl;
    DateTime createdAt;

    Datum({
        required this.id,
        required this.title,
        required this.description,
        required this.imageUrl,
        required this.createdAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image_url": imageUrl,
        "created_at": createdAt.toIso8601String(),
    };
}
