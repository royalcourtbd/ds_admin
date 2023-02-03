import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.brand,
    this.category,
    this.createdAt,
    this.description,
    this.discountPrice,
    this.docId,
    this.highlights,
    this.image,
    this.price,
    this.productId,
    this.productName,
    this.rate,
    this.totalSell,
    this.quantity,
    this.available,
    this.featured,
  });

  String? brand;
  String? category;
  String? createdAt;
  String? description;
  double? discountPrice;
  String? docId;
  String? highlights;
  List<String>? image;
  double? price;
  String? productId;
  String? productName;
  double? rate;
  int? totalSell;
  int? quantity;
  bool? available;
  bool? featured;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        brand: json["brand"],
        category: json["category"],
        createdAt: json["createdAt"],
        description: json["description"],
        discountPrice: json["discountPrice"],
        docId: json["docId"],
        highlights: json["highlights"],
        image: List<String>.from(json["image"].map((x) => x)),
        price: json["price"],
        productId: json["productId"],
        productName: json["productName"],
        rate: json["rate"],
        totalSell: json["totalSell"],
        quantity: json["quantity"],
        available: json["available"],
        featured: json["featured"],
      );

  Map<String, dynamic> toJson() => {
        "brand": brand,
        "category": category,
        "createdAt": createdAt,
        "description": description,
        "discountPrice": discountPrice,
        "docId": docId,
        "highlights": highlights,
        "image": List<dynamic>.from(image!.map((x) => x)),
        "price": price,
        "productId": productId,
        "productName": productName,
        "rate": rate,
        "totalSell": totalSell,
        "quantity": quantity,
        "available": available,
        "featured": featured,
      };
}
