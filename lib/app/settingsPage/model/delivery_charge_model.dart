// To parse this JSON data, do
//
//     final chargeHistoryModel = chargeHistoryModelFromJson(jsonString);

import 'dart:convert';

ChargeHistoryModel chargeHistoryModelFromJson(String str) =>
    ChargeHistoryModel.fromJson(json.decode(str));

String chargeHistoryModelToJson(ChargeHistoryModel data) =>
    json.encode(data.toJson());

class ChargeHistoryModel {
  ChargeHistoryModel({
    this.deliveryFee,
    this.discount,
    this.vat,
  });

  double? deliveryFee;
  double? discount;
  double? vat;

  factory ChargeHistoryModel.fromJson(Map<String, dynamic> json) =>
      ChargeHistoryModel(
        deliveryFee: json["deliveryFee"].toDouble(),
        discount: json["discount"].toDouble(),
        vat: json["vat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "deliveryFee": deliveryFee,
        "discount": discount,
        "vat": vat,
      };
}
