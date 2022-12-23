class CategoryModel {
  CategoryModel({
    this.docId,
    this.bgColor,
    this.categoryId,
    this.categoryName,
    this.image,
    this.createdAt,
  });

  String? docId;
  String? bgColor;
  String? categoryId;
  String? categoryName;
  String? image;
  String? createdAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        docId: json["docId"],
        bgColor: json["bgColor"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        image: json["image"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "bgColor": bgColor,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "image": image,
        "createdAt": createdAt,
      };
}
