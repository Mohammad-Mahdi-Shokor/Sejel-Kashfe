import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarNotifier extends StateNotifier<int> {
  NavBarNotifier() : super(1);
  void selectPage(int index) {
    state = index;
  }
}

final navBarProvider = StateNotifierProvider<NavBarNotifier, int>((_) {
  return NavBarNotifier();
});
