// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.docId,
    this.productId,
    this.productName,
    this.category,
    this.brand,
    this.price,
    this.quantity,
    this.discountPrice,
    this.description,
    this.highlights,
    this.image,
    this.totalSell,
    this.rate,
    this.createdAt,
  });

  String? docId;
  String? productId;
  String? productName;
  String? category;
  String? brand;
  String? price;
  String? quantity;
  String? discountPrice;
  String? description;
  String? highlights;
  String? image;
  String? totalSell;
  String? rate;
  String? createdAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        docId: json["docId"],
        productId: json["productId"],
        productName: json["productName"],
        category: json["category"],
        brand: json["brand"],
        price: json["price"],
        quantity: json["quantity"],
        discountPrice: json["discountPrice"],
        description: json["description"],
        highlights: json["highlights"],
        image: json["image"],
        totalSell: json["totalSell"],
        rate: json["rate"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "productId": productId,
        "productName": productName,
        "category": category,
        "brand": brand,
        "price": price,
        "quantity": quantity,
        "discountPrice": discountPrice,
        "description": description,
        "highlights": highlights,
        "image": image,
        "totalSell": totalSell,
        "rate": rate,
        "createdAt": createdAt,
      };
}
