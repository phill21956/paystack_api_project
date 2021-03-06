import 'package:flutter/material.dart';

import 'package:paystack_api_project/services/api_page.dart';
import 'package:paystack_api_project/widgets/get_bank_widget.dart';
import 'package:paystack_api_project/widgets/resolve_bank_widget.dart';

class HomePage extends StatelessWidget with ApiPageMixin {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APIs'),
      ),
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        reverse: true,
        child: Column(
          children: const [
            GetBankWidget(),
            SizedBox(height: 10),
            ResolveBankWidget(),
          ],
        ),
      ),
    );
  }
}
