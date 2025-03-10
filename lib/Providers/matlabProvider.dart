import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/fe2aat_Male.dart';

final Map<Fe2a, List<bool>> mataleb = {
  Fe2a.bor3om: List.filled(allMataleb[Fe2a.bor3om]!.length, false),
  Fe2a.kashfe: List.filled(allMataleb[Fe2a.kashfe]!.length, false),
  Fe2a.zahra: List.filled(allMataleb[Fe2a.zahra]!.length, false)
};

class MatlabNotifier extends StateNotifier<Map<Fe2a, List<bool>>> {
  static const _key = 'matlab_data';

  MatlabNotifier() : super(mataleb) {
    loadFromPrefs();
  }

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString(_key);
    if (savedData != null) {
      try {
        final Map<Fe2a, List<bool>> loadedData = {};
        final Map<String, dynamic> jsonMap =
            Map<String, dynamic>.from(jsonDecode(savedData));

        for (var key in jsonMap.keys) {
          Fe2a fe2a = Fe2a.values.firstWhere((e) => e.toString() == key);
          List<bool> fe2aData = List<bool>.from(jsonMap[key]);
          loadedData[fe2a] = fe2aData;
        }

        state = loadedData;
      } catch (e) {
        print("Error loading preferences: $e");
      }
    }
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> jsonMap =
        state.map((key, value) => MapEntry(key.toString(), value));

    await prefs.setString(_key, jsonEncode(jsonMap));
  }

  void toggle(Fe2a fe2a, int index) {
    state = {
      ...state,
      fe2a: [
        for (int i = 0; i < state[fe2a]!.length; i++)
          i == index ? !state[fe2a]![i] : state[fe2a]![i]
      ]
    };
    _saveToPrefs();
  }

  void delete() {
    state = mataleb;
    _saveToPrefs();
  }

  int doneCount(Fe2a f) {
    int count = 0;
    for (final a in state[f]!) {
      if (a) {
        count++;
      }
    }
    return count;
  }

  double getSize(Fe2a f) {
    return state[f]!.length.toDouble();
  }

  String getPercentage(Fe2a f) {
    return getSize(f) == 0
        ? "0%"
        : "${((doneCount(f) / getSize(f)) * 100).round()}%";
  }
}

final matlabProvider =
    StateNotifierProvider<MatlabNotifier, Map<Fe2a, List<bool>>>((ref) {
  return MatlabNotifier();
});
