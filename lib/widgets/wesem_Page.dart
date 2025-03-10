import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Providers/UserDataProvider.dart';
import '../Providers/matlabWesemProvider.dart';
import '../data/fe2aat_Male.dart';
import 'tabsScreen.dart';
// import 'package:sejel_kashef/widgets/wesem.dart';

class Wesempage extends ConsumerStatefulWidget {
  const Wesempage({super.key, required this.index});
  final int index;

  @override
  ConsumerState<Wesempage> createState() => _WesempageState();
}

class _WesempageState extends ConsumerState<Wesempage> {
  @override
  Widget build(BuildContext context) {
    Fe2a user = ref.watch(fe2aProvider);
    double width = MediaQuery.of(context).size.width;
    final userColor = fe2aColor[user];
    final wesemMataleb = ref.read(matlabWesemProvider)[user]![widget.index];
    final Iterable<String> Keys = awseme[user]![widget.index];
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
          awsemeNames[user]![widget.index],
          style: const TextStyle(fontSize: 40),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            width: width * 0.85,
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                color: userColor![3], borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                for (int b = 0; b < Keys.length; b++)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Checkbox(
                              value: wesemMataleb[b],
                              onChanged: (_) {
                                setState(() {
                                  ref
                                      .read(matlabWesemProvider.notifier)
                                      .change(widget.index, b, user);
                                });
                              }),
                          const SizedBox(width: 18),
                          Expanded(
                            child: Text(
                              " ${Keys.elementAt(b)} ",
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
                      (b < Keys.length - 1)
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
          ),
        ),
      ),
    );
  }
}
