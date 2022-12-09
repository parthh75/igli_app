// To parse this JSON data, do
//
//     final homePageModal = homePageModalFromJson(jsonString);

import 'dart:convert';

HomePageModal homePageModalFromJson(String str) => HomePageModal.fromJson(json.decode(str));

String homePageModalToJson(HomePageModal data) => json.encode(data.toJson());

class HomePageModal {
  HomePageModal({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory HomePageModal.fromJson(Map<String, dynamic> json) => HomePageModal(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.banners,
    this.ourServices,
  });

  List<Banner>? banners;
  List<OurService>? ourServices;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    ourServices: List<OurService>.from(json["ourServices"].map((x) => OurService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners!.map((x) => x.toJson())),
    "ourServices": List<dynamic>.from(ourServices!.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({
    this.id,
    this.position,
    this.title,
    this.image,
    this.description,
    this.fullImageUrl,
  });

  int? id;
  int? position;
  String? title;
  String? image;
  String? description;
  String? fullImageUrl;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    position: json["position"],
    title: json["title"],
    image: json["image"],
    description: json["description"],
    fullImageUrl: json["fullImageUrl"] == null ? null : json["fullImageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
    "title": title,
    "image": image,
    "description": description,
    "fullImageUrl": fullImageUrl ?? null,
  };
}

class OurService {
  OurService({
    this.id,
    this.position,
    this.name,
    this.logo,
    this.fullLogoUrl,
  });

  int? id;
  int? position;
  String? name;
  String? logo;
  dynamic fullLogoUrl;

  factory OurService.fromJson(Map<String, dynamic> json) => OurService(
    id: json["id"],
    position: json["position"],
    name: json["name"],
    logo: json["logo"],
    fullLogoUrl: json["fullLogoUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
    "name": name,
    "logo": logo,
    "fullLogoUrl": fullLogoUrl,
  };
}
