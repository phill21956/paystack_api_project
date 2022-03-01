import 'package:flutter/material.dart';
import 'package:paystack_api_project/model/bank_model.dart';
import 'package:paystack_api_project/model/resolve_bank_model.dart';
import 'package:paystack_api_project/services/api_page.dart';

class ResolveBankWidget extends StatefulWidget {
  const ResolveBankWidget({Key? key}) : super(key: key);

  @override
  _ResolveBankWidgetState createState() => _ResolveBankWidgetState();
}

class _ResolveBankWidgetState extends State<ResolveBankWidget>
    with ApiPageMixin {
  late Future<GetBank> bankList;
  Future<ResolveBank>? accountNumber;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    bankList = getBank();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Your Account Number?',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _controller2,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Your Bank Code?',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              accountNumber = resolveBank(
                  _controller.text, _controller2.text);
            });
          },
          child: const Text('Confirm Number'),
        ),
        // (50211-KudaBank-2009943490) (058-GTB-0567482425)
        FutureBuilder<ResolveBank>(
          future: accountNumber,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final number = snapshot.data?.data.accountNumber;
                final name = snapshot.data?.data.accountName;
                return Text('$name $number');
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }
            return const Center(child: Text('Loading...'));
          },
        )
      ],
    );
  }
}
