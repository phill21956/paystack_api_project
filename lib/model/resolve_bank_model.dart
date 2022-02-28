// To parse this JSON data, do
//
//     final resolveBank = resolveBankFromJson(jsonString);

import 'dart:convert';

ResolveBank resolveBankFromJson(String str) =>
    ResolveBank.fromJson(json.decode(str));

String resolveBankToJson(ResolveBank data) => json.encode(data.toJson());

class ResolveBank {
  ResolveBank({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data data;

  factory ResolveBank.fromJson(Map<String, dynamic> json) => ResolveBank(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.accountNumber,
    required this.accountName,
    required this.bankId,
  });

  final String accountNumber;
  final String accountName;
  final int bankId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accountNumber: json["account_number"],
        accountName: json["account_name"],
        bankId: json["bank_id"],
      );

  Map<String, dynamic> toJson() => {
        "account_number": accountNumber,
        "account_name": accountName,
        "bank_id": bankId,
      };
}
