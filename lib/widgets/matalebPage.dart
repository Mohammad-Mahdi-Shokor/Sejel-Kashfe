import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sejel_kashef/Providers/NavBarProvider.dart';
// import 'package:sejel_kashef/Providers/UserDataProvider.dart';

import '../Providers/UserDataProvider.dart';
import '../Providers/matlabProvider.dart';
import '../data/fe2aat_Male.dart';
import 'tabsScreen.dart';

class Matalebpage extends ConsumerStatefulWidget {
  const Matalebpage({required this.numberOfMajal, super.key});
  final int numberOfMajal;
  @override
  ConsumerState<Matalebpage> createState() => _MatalebpageState();
}

class _MatalebpageState extends ConsumerState<Matalebpage> {
  List<String> types = [
    "المعارف",
    "المهارات",
    "الإتجاهات",
    "أنشطة تطبيقية كشفية"
  ];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Fe2a user = ref.watch(fe2aProvider);
    final maaref = allMataleb[user];
    final userColor = fe2aColor[user];
    List<bool> matalob = ref.watch(matlabProvider)[user]!;
    void change(int index, int itemIndex) {
      ref.watch(matlabProvider.notifier).toggle(user, index);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) {
                return const Tabsscreen();
              }));
            },
            icon: const Icon(Icons.arrow_back)),
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: fe2aColor[user]![0],
        title: Text(
          masarat[widget.numberOfMajal],
          style: const TextStyle(fontSize: 40),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int number = 0; number < 4; number++)
              (fe2aToMatlabType[user]![number]![widget.numberOfMajal])[0] != -1
                  ? Center(
                      child: specialContainer(width, userColor, user, matalob,
                          maaref, number, types[number], widget.numberOfMajal))
                  : Container()
          ],
        ),
      ),
    );
  }

  Container specialContainer(
      double width,
      List<Color?>? userColor,
      Fe2a user,
      List<bool> mataleb,
      List<String>? maaref,
      int number,
      String name,
      int numberOfMajal) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: width * 0.85,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          color: userColor![3], borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: userColor[1])),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 2,
          ),
          const SizedBox(
            height: 15,
          ),
          for (int b =
                  fe2aToMatlabType[user]![number]![widget.numberOfMajal][0] - 1;
              b < fe2aToMatlabType[user]![number]![widget.numberOfMajal][1];
              b++)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Checkbox(
                        value: mataleb[b],
                        onChanged: (_) {
                          if (!lockedMatlab[user]!.contains(b) ||
                              mataleb[b] == true) {
                            setState(() {
                              ref.read(matlabProvider.notifier).toggle(user, b);
                            });
                            mataleb[b] == false
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      duration: Duration(milliseconds: 1500),
                                      content: Text(
                                        "تم المطلب بنجاح",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      duration: Duration(milliseconds: 1500),
                                      content: Text(
                                        "تمت إزالة المطلب",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                          } else {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text(
                                  "(:  أدخل كلمة السر ",
                                  textAlign: TextAlign.center,
                                ),
                                content: SizedBox(
                                  width: 200,
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextField(
                                        textAlign: TextAlign.center,
                                        onChanged: (value) {
                                          if (value == code) {
                                            Navigator.pop(ctx);
                                            setState(() {
                                              ref
                                                  .read(matlabProvider.notifier)
                                                  .toggle(user, b);
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "تم المطلب بنجاح",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.arrow_back),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
                    lockedMatlab[user]!.contains(b)
                        ? const Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.lock),
                            ],
                          )
                        : const SizedBox(),
                    relatedToWesem[user]!.contains(b)
                        ? const Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.badge_sharp),
                            ],
                          )
                        : Container(),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        " ${maaref![b]} ",
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.notoKufiArabic(
                            fontSize: 20, color: userColor[1]),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      backgroundColor: userColor[2],
                      child: Text(
                        "${b + 1}",
                        style: GoogleFonts.notoKufiArabic(
                            fontSize: 20, color: userColor[1]),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    )
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                (b <
                        (fe2aToMatlabType[user]![number]![widget.numberOfMajal]
                                [1]) -
                            1)
                    ? Column(children: [
                        Divider(
                          color: userColor[2],
                        ),
                        const SizedBox(
                          height: 9,
                        )
                      ])
                    : Container()
              ],
            )
        ],
      ),
    );
  }
}
