import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paystack_api_project/model/bank_model.dart';

mixin ApiPageMixin {
  Future<List<GetBank>> getBank() async {
    final response = await http.get(Uri.parse('https://api.paystack.co/bank'));
    try {
      if (response.statusCode == 200) {
          List<dynamic> body = jsonDecode(response.body);

        List<GetBank> banks = body
            .map(
              (dynamic item) => GetBank.fromJson(item),
            )
            .toList();
            return banks;
      }
    } catch (e) {
      throw 'Unable to retrieve banks';
    }
    return [];
  }
}
