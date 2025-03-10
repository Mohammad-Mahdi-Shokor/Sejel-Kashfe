// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Providers/UserDataProvider.dart';
import 'fe2atak.dart';

class Ka2edor3onsor extends ConsumerWidget {
  const Ka2edor3onsor({super.key});

  @override
  Widget build(BuildContext context, ref) {
    double width = MediaQuery.of(context).size.width;
    Gender gender = ref.read(genderProvider);
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
              width: width * 0.6,
              child: OutlinedButton.icon(
                  icon: const Icon(Icons.leaderboard),
                  onPressed: () {
                    ref.read(typeProvider.notifier).setType(
                        gender == Gender.male
                            ? Type.maleka2ed
                            : Type.femaleka2ed);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => const Fe2atak()));
                  },
                  label: Text(
                    gender == Gender.male ? "قائد" : "قائدة",
                    style: const TextStyle(fontSize: 70),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: width * 0.6,
              child: OutlinedButton.icon(
                  icon: const Icon(Icons.baby_changing_station_sharp),
                  onPressed: () {
                    ref.read(typeProvider.notifier).setType(
                        gender == Gender.male
                            ? Type.maleonsor
                            : Type.femaleonsor);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => const Fe2atak()));
                  },
                  label: Text(
                    gender == Gender.male ? "كشفيّ" : "كشفيّة",
                    style: const TextStyle(fontSize: 70),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
