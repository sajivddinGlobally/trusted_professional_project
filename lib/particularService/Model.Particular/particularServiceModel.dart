// To parse this JSON data, do
//
//     final particularServiceModel = particularServiceModelFromJson(jsonString);

import 'dart:convert';

ParticularServiceModel particularServiceModelFromJson(String str) => ParticularServiceModel.fromJson(json.decode(str));

String particularServiceModelToJson(ParticularServiceModel data) => json.encode(data.toJson());

class ParticularServiceModel {
    String message;
    List<Datum> data;

    ParticularServiceModel({
        required this.message,
        required this.data,
    });

    factory ParticularServiceModel.fromJson(Map<String, dynamic> json) => ParticularServiceModel(
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
    String? description;
    String mobile;
    String serviceLocation;
    String price;
    String image;
    DateTime? date;
    List<Faq> faq;
    String? longDescription;
    String serviceTitle;
    String serviceDescription;

    Datum({
        required this.id,
        required this.title,
        required this.description,
        required this.mobile,
        required this.serviceLocation,
        required this.price,
        required this.image,
        required this.date,
        required this.faq,
        required this.longDescription,
        required this.serviceTitle,
        required this.serviceDescription,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        mobile: json["mobile"],
        serviceLocation: json["service_location"],
        price: json["price"],
        image: json["image"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        faq: List<Faq>.from(json["faq"].map((x) => Faq.fromJson(x))),
        longDescription: json["long_description"],
        serviceTitle: json["service_title"],
        serviceDescription: json["service_description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "mobile": mobile,
        "service_location": serviceLocation,
        "price": price,
        "image": image,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "faq": List<dynamic>.from(faq.map((x) => x.toJson())),
        "long_description": longDescription,
        "service_title": serviceTitle,
        "service_description": serviceDescription,
    };
}

class Faq {
    String answer;
    String question;

    Faq({
        required this.answer,
        required this.question,
    });

    factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        answer: json["answer"],
        question: json["question"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "question": question,
    };
}
