// To parse this JSON data, do
//
//     final getBank = getBankFromJson(jsonString);


import 'dart:convert';

GetBank getBankFromJson(String str) => GetBank.fromJson(json.decode(str));

dynamic getBankToJson(GetBank data) => json.encode(data.toJson());

// class GetBank {
//   GetBank({
//     required this.status,
//     required this.message,
//     required this.data,
//   });

//   final bool status;
//   final String message;
//   final List<Datum> data;

//   factory GetBank.fromJson(Map<String, dynamic> json) => GetBank(
//         status: json["status"],
//         message: json["message"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

class GetBank {
  GetBank({
    required this.name,
    required this.slug,
    required this.code,
    required this.longcode,
    required this.gateway,
    required this.payWithBank,
    required this.active,
    required this.isDeleted,
    required this.country,
    required this.currency,
    required this.type,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  final String name;
  final String slug;
  final String code;
  final String longcode;
  final String gateway;
  final bool payWithBank;
  final bool active;
 final bool isDeleted;
  final String country;
  final String currency;
  final String type;
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory GetBank.fromJson(Map<String, dynamic> json) => GetBank(
        name: json["name"],
        slug: json["slug"],
        code: json["code"],
        longcode: json["longcode"],
        gateway: json["gateway"],
        payWithBank: json["pay_with_bank"],
        active: json["active"],
        isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
        country: json["country"],
        currency: json["currency"],
        type: json["type"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]), 
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "code": code,
        "longcode": longcode,
        "gateway": gateway == null ? null : gateway,
        "pay_with_bank": payWithBank,
        "active": active,
        "is_deleted": isDeleted == null ? null : isDeleted,
        "country": countryValues.reverse[country],
        "currency": currencyValues.reverse[currency],
        "type": typeValues.reverse[type],
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

enum Country { NIGERIA }

final countryValues = EnumValues({"Nigeria": Country.NIGERIA});

enum Currency { NGN }

final currencyValues = EnumValues({"NGN": Currency.NGN});

// ignore: constant_identifier_names
enum Type { NUBAN }

final typeValues = EnumValues({"nuban": Type.NUBAN});

class EnumValues<T> {
  Map<String, T> map;
late  Map<T, String> reverseMap;

 EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
