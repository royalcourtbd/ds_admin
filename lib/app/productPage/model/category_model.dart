// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.docId,
    this.categoryId,
    this.categoryName,
    this.image,
    this.createdAt,
  });

  String? docId;
  String? categoryId;
  String? categoryName;
  String? image;
  String? createdAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        docId: json["docId"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        image: json["image"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "image": image,
        "createdAt": createdAt,
      };
}
