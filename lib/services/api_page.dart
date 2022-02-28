import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:paystack_api_project/model/bank_model.dart';
import 'package:paystack_api_project/model/resolve_bank_model.dart';

import '../key/key.dart';

// mixin ApiPageMixin {
//   Future<GetBank> getBank() async {
//      var client = http.Client();
//     // ignore: prefer_typing_uninitialized_variables
//     var getBank;

//     try {
//       final response =
//           await client.get(Uri.parse('https://api.paystack.co/bank'));
//       if (response.statusCode == 200) {
//        var jsonString = response.body;
//         var jsonMap = json.decode(jsonString);

//         getBank = GetBank.fromJson(jsonMap);
//       }
//     } catch (e) {
//       return getBank;
//     }
//     return getBank;
//   }
// }

///USING MAP
mixin ApiPageMixin {
 

  Future<GetBank> getBank() async {
    var client = http.Client();

    final response =
        await client.get(Uri.parse('https://api.paystack.co/bank'));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      var getbanks = GetBank.fromJson(body);
      return getbanks;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<ResolveBank> resolveBank(
     int? accountNumber,
     int? bankCode, 
  ) async {
           String resolveBankUrl =
        'https://api.paystack.co/bank/resolve?account_number=$accountNumber&bank_code=$bankCode';
    final response = await http.get(
      Uri.parse(resolveBankUrl),
       headers: {'Authorization': 'Bearer $key'}
        );
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      var resolveBanks = ResolveBank.fromJson(body);
      return resolveBanks;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
