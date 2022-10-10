// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'dart:convert';

BrandModel brandModelFromJson(String str) =>
    BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  BrandModel({
    this.docId,
    this.brandId,
    this.brandName,
    this.image,
    this.createdAt,
  });

  String? docId;
  String? brandId;
  String? brandName;
  String? image;
  String? createdAt;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        docId: json["docId"],
        brandId: json["brandId"],
        brandName: json["brandName"],
        image: json["image"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "brandId": brandId,
        "brandName": brandName,
        "image": image,
        "createdAt": createdAt,
      };
}
