import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Providers/UserDataProvider.dart';
import 'ka2edOr3onsor.dart';

// ignore: subtype_of_sealed_class
class Maleorfemale extends ConsumerWidget {
  const Maleorfemale({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
            SizedBox(
              width: 0.6 * width,
              child: OutlinedButton(
                  onPressed: () {
                    ref.read(genderProvider.notifier).setGender(Gender.male);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => const Ka2edor3onsor()));
                  },
                  child: const Text(
                    "فتية",
                    style: TextStyle(fontSize: 70),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 0.6 * width,
              child: OutlinedButton(
                  onPressed: () {
                    ref.read(genderProvider.notifier).setGender(Gender.female);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => const Ka2edor3onsor()));
                  },
                  child: const Text(
                    "فتيات",
                    style: TextStyle(fontSize: 70),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
