import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Providers/UserDataProvider.dart';
import '../data/fe2aat_Male.dart';
import 'matalebPage.dart';

class Masar extends ConsumerStatefulWidget {
  const Masar({super.key});

  @override
  ConsumerState<Masar> createState() => _MasarState();
}

class _MasarState extends ConsumerState<Masar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Fe2a jawad = ref.watch(fe2aProvider);
    return Center(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width > 700 ? 4 : 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1),
          children: [
            for (int i = 0; i < masarat.length; i++)
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => Matalebpage(
                                numberOfMajal: i,
                              )));
                },
                child: Stack(children: [
                  Container(
                    width: 230,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(18),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 160,
                          backgroundImage: AssetImage(imageMajal(i, jawad)),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: fe2aColor[jawad]![0],
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    masarat[i],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: fe2aColor[jawad]![1])),
                                const SizedBox(
                                  height: 6,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                          radius: 23,
                          backgroundColor: fe2aColor[jawad]![2],
                          child: Text(
                            "${i + 1}",
                            style: TextStyle(
                                color: fe2aColor[jawad]![1],
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          )),
                    ),
                  ),
                ]),
              ),
          ],
        ),
      ),
    );
  }
}
