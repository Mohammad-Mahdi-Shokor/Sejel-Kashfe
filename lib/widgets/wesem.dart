import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Providers/UserDataProvider.dart';
import '../Providers/matlabWesemProvider.dart';
import '../data/fe2aat_Male.dart';
import 'wesem_Page.dart';

class Wesem extends ConsumerStatefulWidget {
  const Wesem({super.key});

  @override
  ConsumerState<Wesem> createState() => _WesemState();
}

class _WesemState extends ConsumerState<Wesem> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Fe2a jawad = ref.read(fe2aProvider);
    final isDone = ref.watch(matlabWesemProvider.notifier).isDone(jawad);
    List<double> percentages =
        ref.read(matlabWesemProvider.notifier).getCount(jawad);
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
            for (int i = 0; i < awseme[jawad]!.length; i++)
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => Wesempage(
                                index: i,
                              )));
                },
                child: Center(
                  child: Stack(children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageWesem(i, jawad),
                          ),
                          borderRadius: BorderRadius.circular(110),
                          color: Colors.white),
                      margin: const EdgeInsets.all(18),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularPercentIndicator(
                            radius: 90,
                            lineWidth: 11,
                            percent: percentages[i],
                            progressColor:
                                isDone[i] ? Colors.green : Colors.yellow[400],
                            backgroundColor: Colors.red,
                          ),
                          Positioned(
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromRGBO(60, 163, 163, 0.8),
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
                                      awsemeNames[jawad]![i],
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
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
