class CarouselImageModel {
  CarouselImageModel({
    this.docId,
    this.imageId,
    this.imagePath,
    this.createdAt,
  });

  String? docId;
  String? imageId;
  String? imagePath;
  String? createdAt;

  factory CarouselImageModel.fromJson(Map<String, dynamic> json) =>
      CarouselImageModel(
        docId: json["docId"],
        imageId: json["imageId"],
        imagePath: json["imagePath"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "imageId": imageId,
        "imagePath": imagePath,
        "createdAt": createdAt,
      };
}
