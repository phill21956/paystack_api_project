import 'package:flutter/material.dart';
import 'package:paystack_api_project/services/api_page.dart';

import '../model/bank_model.dart';

class GetBankWidget extends StatefulWidget {
  const GetBankWidget({Key? key}) : super(key: key);

  @override
  State<GetBankWidget> createState() => _GetBankWidgetState();
}

class _GetBankWidgetState extends State<GetBankWidget> with ApiPageMixin {
  // late Future<GetBank> banks;

  // @override
  // void initState() {
  //   super.initState();
  //   banks = getBank();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GetBank>>(
      future: getBank(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
         // List<GetBank>? banks = snapshot.data;

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, banks) {
              return Card(
                child: ListTile(
                  title: Text(snapshot.data as String),
                ),
              );
            },
            // children: banks!
            //     .map((GetBank banks) => Card(
            //           child: ListTile(
            //             title: Text(banks.name),
            //           ),
            //         ))
            //     .toList(),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: Text('Loading...'));
      },
    );
  }
}
