class UserModel {
  UserModel({
    this.userId,
    this.accountBalance,
    this.name,
    this.email,
  });

  String? userId;
  int? accountBalance;
  String? name;
  String? email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        accountBalance: json["accountBalance"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "accountBalance": accountBalance,
        "name": name,
        "email": email,
      };
}
