import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Providers/UserDataProvider.dart' show isUserProvider;
import 'data/fe2aat_Male.dart';
import 'widgets/MaleOrFemale.dart';
import 'widgets/tabsScreen.dart';
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isUser = ref.watch(isUserProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sejel Demo",
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: fe2aColor[Fe2a.bor3om]![0]!),
        useMaterial3: true,
      ),
      home: !isUser ? const Maleorfemale() : const Tabsscreen(),
    );
  }
}
