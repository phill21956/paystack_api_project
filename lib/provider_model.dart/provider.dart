import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:paystack_api_project/services/api_page.dart';

final getBankProvider = FutureProvider((ref) async =>  ApiPageMixin().getBank);
final resolveBankProvider = FutureProvider((ref) async => ApiPageMixin().resolveBank);




