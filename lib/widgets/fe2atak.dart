import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Providers/UserDataProvider.dart';
import '../data/fe2aat_Male.dart';
import 'tabsScreen.dart';

class Fe2atak extends ConsumerWidget {
  const Fe2atak({super.key});

  @override
  Widget build(BuildContext context, ref) {
    double height = MediaQuery.of(context).size.width;
    Gender gender = ref.read(genderProvider);
    final Map<String, Map<String, dynamic>> fe2at = gender == Gender.male
        ? {
            "البراعم": {
              // "image": "",
              "Fe2a": Fe2a.bor3om // to add please add it
            },
            // "الأشبال": {
            //   // "image"
            //   "Fe2a": Fe2a.shebel
            // },
            "الكشافة": <String, dynamic>{
              // "image": "",
              "Fe2a": Fe2a.kashfe
            },
            // "الجوالة": {
            //   // "image": "",
            //   "Fe2a": Fe2a.jawal
            // }
          }
        : {
            // "البراعم": {
            //   // "image": "",
            //   "Fe2a": Fe2a.bor3om // to add please add it
            // },
            "الزهرات": {
              // "image"
              "Fe2a": Fe2a.zahra
            },
            // "المرشدات": <String, dynamic>{
            //   // "image": "",
            //   "Fe2a": Fe2a.morsheda
            // },
            // "الدليلات": {
            //   // "image": "",
            //   "Fe2a": Fe2a.dalila
            // }
          };
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width > 800 ? width * 0.1 : 85,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "اختر الفئة",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: width > 800 ? width * 0.1 : 50),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...fe2at.keys.map((type) {
              return Column(children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: width > 800 ? 64 : 16),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ref
                          .read(fe2aProvider.notifier)
                          .setFe2a(fe2at[type]!["Fe2a"]);
                      ref.read(isUserProvider.notifier).beUser();
                      ref.read(isUserProvider.notifier).beUser();
                      // Navigate to the corresponding screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Tabsscreen(),
                        ),
                      );
                    },
                    label: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            type,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width > 600
                                  ? 75
                                  : 45,
                            ),
                          )
                        ]),
                  ),
                ),
                SizedBox(height: height * 0.07),
              ]);
            })
          ],
        ),
      ),
    );
  }
}
