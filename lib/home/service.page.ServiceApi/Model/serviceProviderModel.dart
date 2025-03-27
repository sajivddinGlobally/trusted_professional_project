// To parse this JSON data, do
//
//     final serviceProviderModel = serviceProviderModelFromJson(jsonString);

import 'dart:convert';

ServiceProviderModel serviceProviderModelFromJson(String str) => ServiceProviderModel.fromJson(json.decode(str));

String serviceProviderModelToJson(ServiceProviderModel data) => json.encode(data.toJson());

class ServiceProviderModel {
    List<ServiceProvider> serviceProviders;

    ServiceProviderModel({
        required this.serviceProviders,
    });

    factory ServiceProviderModel.fromJson(Map<String, dynamic> json) => ServiceProviderModel(
        serviceProviders: List<ServiceProvider>.from(json["service_providers"].map((x) => ServiceProvider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "service_providers": List<dynamic>.from(serviceProviders.map((x) => x.toJson())),
    };
}

class ServiceProvider {
    int id;
    int userId;
    int subCategoryId;
    int categoryId;
    String bannerImage;
    String title;
    String description;
    String serviceLocation;
    String availabilityTime;
    String startingPrice;
    String whatsIncludedDescription;
    String fullPackageDescription;
    String emergencyServiceDescription;
    List<String> serviceGalleryImages;
    DateTime createdAt;
    DateTime updatedAt;
    String userName;
    String subCategoryName;
    String categoryName;

    ServiceProvider({
        required this.id,
        required this.userId,
        required this.subCategoryId,
        required this.categoryId,
        required this.bannerImage,
        required this.title,
        required this.description,
        required this.serviceLocation,
        required this.availabilityTime,
        required this.startingPrice,
        required this.whatsIncludedDescription,
        required this.fullPackageDescription,
        required this.emergencyServiceDescription,
        required this.serviceGalleryImages,
        required this.createdAt,
        required this.updatedAt,
        required this.userName,
        required this.subCategoryName,
        required this.categoryName,
    });

    factory ServiceProvider.fromJson(Map<String, dynamic> json) => ServiceProvider(
        id: json["id"],
        userId: json["user_id"],
        subCategoryId: json["sub_category_id"],
        categoryId: json["category_id"],
        bannerImage: json["banner_image"],
        title: json["title"],
        description: json["description"],
        serviceLocation: json["service_location"],
        availabilityTime: json["availability_time"],
        startingPrice: json["starting_price"],
        whatsIncludedDescription: json["whats_included_description"],
        fullPackageDescription: json["full_package_description"],
        emergencyServiceDescription: json["emergency_service_description"],
        serviceGalleryImages: List<String>.from(json["service_gallery_images"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userName: json["user_name"],
        subCategoryName: json["sub_category_name"],
        categoryName: json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "sub_category_id": subCategoryId,
        "category_id": categoryId,
        "banner_image": bannerImage,
        "title": title,
        "description": description,
        "service_location": serviceLocation,
        "availability_time": availabilityTime,
        "starting_price": startingPrice,
        "whats_included_description": whatsIncludedDescription,
        "full_package_description": fullPackageDescription,
        "emergency_service_description": emergencyServiceDescription,
        "service_gallery_images": List<dynamic>.from(serviceGalleryImages.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_name": userName,
        "sub_category_name": subCategoryName,
        "category_name": categoryName,
    };
}
