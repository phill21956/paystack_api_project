import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paystack_api_project/model/bank_model.dart';

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

    var  getbanks = GetBank.fromJson(body);
      return getbanks;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
