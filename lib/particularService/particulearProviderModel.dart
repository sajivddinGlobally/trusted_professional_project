// To parse this JSON data, do
//
//     final particularServiceProviderModel = particularServiceProviderModelFromJson(jsonString);

import 'dart:convert';

ParticularServiceProviderModel particularServiceProviderModelFromJson(String str) => ParticularServiceProviderModel.fromJson(json.decode(str));

String particularServiceProviderModelToJson(ParticularServiceProviderModel data) => json.encode(data.toJson());

class ParticularServiceProviderModel {
    Service service;

    ParticularServiceProviderModel({
        required this.service,
    });

    factory ParticularServiceProviderModel.fromJson(Map<String, dynamic> json) => ParticularServiceProviderModel(
        service: Service.fromJson(json["service"]),
    );

    Map<String, dynamic> toJson() => {
        "service": service.toJson(),
    };
}

class Service {
    int id;
    int userId;
    int subCategoryId;
    String bannerImage;
    String title;
    String description;
    String serviceLocation;
    String availabilityTime;
    String startingPrice;
    String status;
    String whatsIncludedDescription;
    String fullPackageDescription;
    String emergencyServiceDescription;
    List<String> serviceGalleryImages;
    DateTime createdAt;
    DateTime updatedAt;
    String userName;
    String subCategoryName;

    Service({
        required this.id,
        required this.userId,
        required this.subCategoryId,
        required this.bannerImage,
        required this.title,
        required this.description,
        required this.serviceLocation,
        required this.availabilityTime,
        required this.startingPrice,
        required this.status,
        required this.whatsIncludedDescription,
        required this.fullPackageDescription,
        required this.emergencyServiceDescription,
        required this.serviceGalleryImages,
        required this.createdAt,
        required this.updatedAt,
        required this.userName,
        required this.subCategoryName,
    });

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        userId: json["user_id"],
        subCategoryId: json["sub_category_id"],
        bannerImage: json["banner_image"],
        title: json["title"],
        description: json["description"],
        serviceLocation: json["service_location"],
        availabilityTime: json["availability_time"],
        startingPrice: json["starting_price"],
        status: json["status"],
        whatsIncludedDescription: json["whats_included_description"],
        fullPackageDescription: json["full_package_description"],
        emergencyServiceDescription: json["emergency_service_description"],
        serviceGalleryImages: List<String>.from(json["service_gallery_images"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userName: json["user_name"],
        subCategoryName: json["sub_category_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "sub_category_id": subCategoryId,
        "banner_image": bannerImage,
        "title": title,
        "description": description,
        "service_location": serviceLocation,
        "availability_time": availabilityTime,
        "starting_price": startingPrice,
        "status": status,
        "whats_included_description": whatsIncludedDescription,
        "full_package_description": fullPackageDescription,
        "emergency_service_description": emergencyServiceDescription,
        "service_gallery_images": List<dynamic>.from(serviceGalleryImages.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_name": userName,
        "sub_category_name": subCategoryName,
    };
}
