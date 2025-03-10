import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/fe2aat_Male.dart';

enum Gender { male, female }

enum Type { maleka2ed, maleonsor, femaleka2ed, femaleonsor }

final typeName = {
  Type.maleka2ed: "قائد",
  Type.maleonsor: "عنصر",
  Type.femaleka2ed: "قائدة",
  Type.femaleonsor: "كشفية",
};

class Fe2aNotifier extends StateNotifier<Fe2a> {
  Fe2aNotifier() : super(Fe2a.bor3om) {
    _loadFromPrefs();
  }

  static const _key = "Fe2a";

  /// Updates state and saves to SharedPreferences
  Future<void> setFe2a(Fe2a f) async {
    state = f;
    await _saveToPrefs(f);
  }

  /// Loads the stored value from SharedPreferences
  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString(_key); // Get stored value

    if (savedData != null) {
      state = Fe2a.values.firstWhere(
        (e) => e.toString() == savedData,
        orElse: () => Fe2a.bor3om, // Default if not found
      );
    }
  }

  /// Saves `Fe2a` as a String in SharedPreferences
  Future<void> _saveToPrefs(Fe2a f) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, f.toString()); // Save as String
  }
}

final fe2aProvider = StateNotifierProvider<Fe2aNotifier, Fe2a>((_) {
  return Fe2aNotifier();
});

class GenderNotifier extends StateNotifier<Gender> {
  static const _key = "Gender";
  GenderNotifier() : super(Gender.male) {
    loadFromp();
  }
  void setGender(Gender g) async {
    state = g;
    await saveToPrefs(g);
  }

  Future<void> saveToPrefs(Gender g) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, g.toString());
  }

  Future<void> loadFromp() async {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString("Gender");
    if (savedData != null) {
      state = Gender.values.firstWhere(
        (e) => e.toString() == savedData,
        orElse: () => Gender.male,
      );
    }
  }
}

final genderProvider = StateNotifierProvider<GenderNotifier, Gender>((_) {
  return GenderNotifier();
});

class TypeNotifier extends StateNotifier<Type> {
  TypeNotifier() : super(Type.maleonsor) {
    loadFromp();
  }
  void setType(Type t) {
    state = t;
  }

  Future<void> loadFromp() async {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.get("Type");
    if (savedData != null) {
      state = savedData as Type;
    }
  }
}

final typeProvider = StateNotifierProvider<TypeNotifier, Type>((_) {
  return TypeNotifier();
});

class IsUserNotifier extends StateNotifier<bool> {
  IsUserNotifier() : super(false) {
    _loadFromPrefs();
  }

  /// Method to set user state and save it in SharedPreferences
  Future<void> beUser() async {
    state = true;
    await _saveToPrefs(true);
  }

  /// Load state from SharedPreferences
  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool("isUser") ?? false;
  }

  /// Save state to SharedPreferences
  Future<void> _saveToPrefs(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isUser", value);
  }
}

final isUserProvider = StateNotifierProvider<IsUserNotifier, bool>((_) {
  return IsUserNotifier();
});
