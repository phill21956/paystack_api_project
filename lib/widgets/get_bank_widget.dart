import 'package:flutter/material.dart';
import 'package:paystack_api_project/services/api_page.dart';

import '../model/bank_model.dart';

class GetBankWidget extends StatefulWidget {
  const GetBankWidget({Key? key}) : super(key: key);

  @override
  State<GetBankWidget> createState() => _GetBankWidgetState();
}

class _GetBankWidgetState extends State<GetBankWidget> with ApiPageMixin {
  late Future<GetBank> _getBanks;
  String dropDownValue = 'Abbey Mortgage Bank';

  @override
  void initState() {
    _getBanks = getBank();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetBank>(
      future: _getBanks,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var listOfBankNames =
              snapshot.data?.data.map((bank) => bank).toList();
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: DropdownButton<String>(
              value: dropDownValue,
              onChanged: (newValue) {
                setState(() {
                  dropDownValue = newValue!;
                });
              },
              items: listOfBankNames?.map((bankName) {
                return DropdownMenuItem<String>(
                  value: bankName.name,
                  child: Text(
                    'Bank: ${bankName.name}\nBank Code: ${bankName.code}',
                  ),
                );
              }).toList(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: Text('Loading...'));
      },
    );
  }
}

///USING MAP
//  FutureBuilder<GetBank>(
//       future: getBank(),
//       builder: (context,  snapshot) {
//         if (snapshot.hasData) {
//           List<Datum> banks = snapshot.data!.data;
//           return ListView(
//             children: banks
//                 .map(
//                   (Datum banks) => ListTile(
//                     title: Text(banks.name),
                   
//                   ),
//                 )
//                 .toList(),
//           );
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }
//         return const Center(child: Text('Loading...'));
//       },
//     );



///USING LISTVIEW.BUILDER
//  FutureBuilder<GetBank>(
//       future: _getBanks,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data!.data.length,
//             itemBuilder: (context, index) {
//               var banks = snapshot.data!.data[index];
//               return Card(
//                 child: ListTile(
//                   title: Text(banks.name[index]),
//                  // subtitle: Text(banks.code),
//                 ),
//               );
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }
//         return const Center(child: Text('Loading...'));
//       },
//     );