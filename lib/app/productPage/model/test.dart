class TestModel {
  TestModel({
    this.path,
  });

  List<String>? path;

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        path: List<String>.from(json["path"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "path": List<dynamic>.from(path!.map((x) => x)),
      };
}
