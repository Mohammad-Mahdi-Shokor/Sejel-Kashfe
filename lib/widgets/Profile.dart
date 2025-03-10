import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../Providers/UserDataProvider.dart';
import '../Providers/matlabProvider.dart';
import '../Providers/matlabWesemProvider.dart';
import '../data/fe2aat_Male.dart';
// import 'package:transparent_image/transparent_image.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final Fe2a jawad = ref.watch(fe2aProvider);
    List<double> percentages =
        ref.read(matlabWesemProvider.notifier).getCount(jawad);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    List<bool> isDone = ref.watch(matlabWesemProvider.notifier).isDone(jawad);
    Gender gender = ref.watch(genderProvider);
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      image: NetworkImage(gender == Gender.male
                          ? "data:image/png;base64,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"
                          : "data:image/png;base64,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"))),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${fe2aName[jawad]!} ${(gender == Gender.male) ? ": فلان الفولاني" : ": فلانة الفولانية"}",
                  style: const TextStyle(
                      backgroundColor: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width > 950 ? width * 0.2 : width * 0.35,
              child: Card(
                child: Column(
                  children: [
                    Text(
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                        ref
                            .watch(matlabProvider.notifier)
                            .getPercentage(jawad)),
                    const Text(
                      "المطالب ",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 25, color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width * 0.11,
            ),
            SizedBox(
              width: width > 950 ? width * 0.2 : width * 0.35,
              child: Card(
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: Image.network(
                            "data:image/jpeg;base64,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",
                          ).image,
                        )),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              style: const TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                              "${ref.watch(matlabWesemProvider.notifier).getHowManyDone(jawad)}"),
                          const Text(
                            "الأوسمة",
                            textDirection: TextDirection.rtl,
                            style:
                                TextStyle(fontSize: 25, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: fe2aColor[jawad]![0],
            ),
            alignment: Alignment.center,
            width: width * 0.8,
            height: height * 0.34,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width > 700 ? 15 : 5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1),
              children: [
                for (int i = 0; i < awsemeNames[jawad]!.length; i++)
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Stack(alignment: Alignment.center, children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                        ),
                        isDone[i]
                            ? Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                        image: imageWesem(i, jawad))))
                            : ColorFiltered(
                                colorFilter: const ColorFilter.matrix([
                                  0.2126, 0.7152, 0.0722, 0, 0, // Red channel
                                  0.2126, 0.7152, 0.0722, 0,
                                  0, // Green channel
                                  0.2126, 0.7152, 0.0722, 0,
                                  0, // Blue channel
                                  0, 0, 0, 1, 0, // Alpha channel
                                ]),
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                            image: imageWesem(i, jawad)))),
                              ),
                        !isDone[i]
                            ? CircularPercentIndicator(
                                radius: isDone[i] ? 28 : 25,
                                lineWidth: 4,
                                percent: percentages[i],
                                progressColor: isDone[i]
                                    ? fe2aColor[jawad]![3]
                                    : Colors.yellow,
                                backgroundColor: Colors.red.shade600)
                            : const SizedBox(),
                      ]))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
