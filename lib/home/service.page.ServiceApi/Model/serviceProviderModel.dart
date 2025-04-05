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
    String bannerImage;
    String title;
    String description;
    ServiceLocation serviceLocation;
    AvailabilityTime availabilityTime;
    String startingPrice;
    Status status;
    String whatsIncludedDescription;
    FullPackageDescription fullPackageDescription;
    EmergencyServiceDescription emergencyServiceDescription;
    List<String> serviceGalleryImages;
    DateTime createdAt;
    DateTime updatedAt;
    UserName userName;
    SubCategoryName subCategoryName;

    ServiceProvider({
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

    factory ServiceProvider.fromJson(Map<String, dynamic> json) => ServiceProvider(
        id: json["id"],
        userId: json["user_id"],
        subCategoryId: json["sub_category_id"],
        bannerImage: json["banner_image"],
        title: json["title"],
        description: json["description"],
        serviceLocation: serviceLocationValues.map[json["service_location"]]!,
        availabilityTime: availabilityTimeValues.map[json["availability_time"]]!,
        startingPrice: json["starting_price"],
        status: statusValues.map[json["status"]]!,
        whatsIncludedDescription: json["whats_included_description"],
        fullPackageDescription: fullPackageDescriptionValues.map[json["full_package_description"]]!,
        emergencyServiceDescription: emergencyServiceDescriptionValues.map[json["emergency_service_description"]]!,
        serviceGalleryImages: List<String>.from(json["service_gallery_images"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userName: userNameValues.map[json["user_name"]]!,
        subCategoryName: subCategoryNameValues.map[json["sub_category_name"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "sub_category_id": subCategoryId,
        "banner_image": bannerImage,
        "title": titleValues.reverse[title],
        "description": description,
        "service_location": serviceLocationValues.reverse[serviceLocation],
        "availability_time": availabilityTimeValues.reverse[availabilityTime],
        "starting_price": startingPrice,
        "status": statusValues.reverse[status],
        "whats_included_description": whatsIncludedDescription,
        "full_package_description": fullPackageDescriptionValues.reverse[fullPackageDescription],
        "emergency_service_description": emergencyServiceDescriptionValues.reverse[emergencyServiceDescription],
        "service_gallery_images": List<dynamic>.from(serviceGalleryImages.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_name": userNameValues.reverse[userName],
        "sub_category_name": subCategoryNameValues.reverse[subCategoryName],
    };
}

enum AvailabilityTime {
    THE_1030_PM,
    THE_10_AM_12_PM,
    THE_9_AM_6_PM
}

final availabilityTimeValues = EnumValues({
    "10:30 PM": AvailabilityTime.THE_1030_PM,
    "10 Am- 12PM": AvailabilityTime.THE_10_AM_12_PM,
    "9 AM - 6 PM": AvailabilityTime.THE_9_AM_6_PM
});

enum EmergencyServiceDescription {
    TESTING,
    THE_247_EMERGENCY_ELECTRICIAN_SERVICE_AVAILABLE,
    THE_247_EMERGENCY_PLUMBING_SERVICE_AVAILABLE
}

final emergencyServiceDescriptionValues = EnumValues({
    "testing": EmergencyServiceDescription.TESTING,
    "24/7 emergency electrician service available": EmergencyServiceDescription.THE_247_EMERGENCY_ELECTRICIAN_SERVICE_AVAILABLE,
    "24/7 emergency plumbing service available": EmergencyServiceDescription.THE_247_EMERGENCY_PLUMBING_SERVICE_AVAILABLE
});

enum FullPackageDescription {
    COMPLETE_PLUMBING_SOLUTIONS_FOR_HOMES_AND_OFFICES,
    TESTING
}

final fullPackageDescriptionValues = EnumValues({
    "Complete plumbing solutions for homes and offices": FullPackageDescription.COMPLETE_PLUMBING_SOLUTIONS_FOR_HOMES_AND_OFFICES,
    "testing": FullPackageDescription.TESTING
});

enum ServiceLocation {
    JAIPUR,
    NEW_YORK
}

final serviceLocationValues = EnumValues({
    "jaipur": ServiceLocation.JAIPUR,
    "New York": ServiceLocation.NEW_YORK
});

enum Status {
    PENDING
}

final statusValues = EnumValues({
    "pending": Status.PENDING
});

enum SubCategoryName {
    DUSTRING,
    PLUMING,
    TITLE_OF_SUB_CATEGORY
}

final subCategoryNameValues = EnumValues({
    "Dustring": SubCategoryName.DUSTRING,
    "Pluming": SubCategoryName.PLUMING,
    "Title of Sub category": SubCategoryName.TITLE_OF_SUB_CATEGORY
});

enum Title {
    ELECTRICIAN_SERVICE,
    PENTER,
    PLUMBING_SERVICE
}

final titleValues = EnumValues({
    "Electrician Service": Title.ELECTRICIAN_SERVICE,
    "Penter": Title.PENTER,
    "Plumbing Service": Title.PLUMBING_SERVICE
});

enum UserName {
    ARMAN,
    FIROZ
}

final userNameValues = EnumValues({
    "arman": UserName.ARMAN,
    "firoz": UserName.FIROZ
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
