// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../Providers/NavBarProvider.dart';
import '../Providers/UserDataProvider.dart';
import '../Providers/matlabProvider.dart';
import '../Providers/matlabWesemProvider.dart';
import '../data/fe2aat_Male.dart';
import 'MaleOrFemale.dart';
import 'Masar.dart';
import 'Profile.dart';
import 'masarDrawer.dart';
import 'wesem.dart';

class Tabsscreen extends ConsumerStatefulWidget {
  const Tabsscreen({super.key});
  @override
  ConsumerState<Tabsscreen> createState() => _TabsscreenState();
}

class _TabsscreenState extends ConsumerState<Tabsscreen> {
  @override
  void initState() {
    super.initState();
    ref.read(matlabWesemProvider.notifier).loadFromPrefs();
    ref.read(matlabProvider.notifier).loadFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    Fe2a jawad = ref.watch(fe2aProvider); // Use watch for reactivity

    Widget activeScreen = const Masar();
    String activeTitle = masaratName[jawad]!;
    int selectedPageIndex = ref.watch(navBarProvider);

    if (selectedPageIndex == 0) {
      activeScreen = const Profile();
      activeTitle = "الملف الشخصي";
    } else if (selectedPageIndex == 2) {
      activeScreen = const Wesem();
      activeTitle = "الأوسمة";
    }

    return Scaffold(
      backgroundColor: fe2aColor[jawad]![1],
      drawer: selectedPageIndex == 1 ? const Masardrawer() : null,
      appBar: AppBar(
        leading: selectedPageIndex == 0
            ? IconButton.outlined(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text(
                        "أكتب 1234 لإزالة الحساب",
                        textAlign: TextAlign.center,
                      ),
                      content: SizedBox(
                        width: 200,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                if (value == "1234") {
                                  Navigator.pop(ctx);
                                  setState(() {
                                    ref.read(matlabProvider.notifier).delete();
                                    ref
                                        .read(matlabWesemProvider.notifier)
                                        .delete();
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "تمت إزالة الحساب",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (ctx) {
                                    return const Maleorfemale();
                                  }));
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
                },
                color: fe2aColor[jawad]![1],
                icon: Icon(
                  Icons.delete,
                  color: fe2aColor[jawad]![1],
                  size: 35,
                ))
            : null,
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: fe2aColor[jawad]![0],
        title: Text(
          activeTitle,
          style: const TextStyle(fontSize: 40),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedPageIndex,
        onTap: (index) {
          ref.read(navBarProvider.notifier).selectPage(index);
        },
        backgroundColor: fe2aColor[jawad]![1]!, // Matches body background
        color: fe2aColor[jawad]![0]!, // Matches AppBar color
        animationDuration: const Duration(milliseconds: 300),
        items: [
          Icon(Icons.man, size: 50, color: fe2aColor[jawad]![1]),
          Icon(
            Icons.map_outlined,
            size: 50,
            color: fe2aColor[jawad]![1],
          ),
          Icon(Icons.card_giftcard, size: 50, color: fe2aColor[jawad]![1]),
        ],
      ),
      body: activeScreen,
    );
  }
}
