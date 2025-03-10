import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/fe2aat_Male.dart';

final mWesem = {
  Fe2a.bor3om: [
    for (final w in awseme[Fe2a.bor3om]!) List.filled(w.length, false)
  ],
  Fe2a.kashfe: [
    for (final x in awseme[Fe2a.kashfe]!) List.filled(x.length, false),
  ],
  Fe2a.zahra: [
    for (final z in awseme[Fe2a.zahra]!) List.filled(z.length, false)
  ],
};

class MatlabWesemNotifier extends StateNotifier<Map<Fe2a, List<List<bool>>>> {
  MatlabWesemNotifier() : super(mWesem) {
    loadFromPrefs();
  }

  static const _key = "MatlabWesemProgress";

  // ✅ Load saved progress from SharedPreferences
  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString(_key);

    if (savedData != null) {
      try {
        final decodedData = jsonDecode(savedData) as Map<String, dynamic>;
        state = decodedData.map((key, value) {
          return MapEntry(
            Fe2a.values.firstWhere((e) => e.toString() == key,
                orElse: () => Fe2a.bor3om),
            (value as List)
                .map<List<bool>>((list) => List<bool>.from(list))
                .toList(),
          );
        });
      } catch (e) {
        log("Error loading data: $e");
      }
    }
  }

  // ✅ Save progress to SharedPreferences
  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData =
        state.map((key, value) => MapEntry(key.toString(), value));
    await prefs.setString(_key, jsonEncode(encodedData));
  }

  void delete() {
    state = mWesem;
    _saveToPrefs();
  }

  // ✅ Toggle (Change) a specific item
  void change(int index, int b, Fe2a f) {
    state[f]![index][b] = !state[f]![index][b];
    _saveToPrefs(); // Save after change
  }

  List<double> getCount(Fe2a f) {
    log(state[f]!.length.toString());
    List<double> s = state[f]!.map((matlab) {
      double count = 0.0;
      for (final m in matlab) {
        if (m) {
          count++;
        }
      }
      return count / matlab.length;
    }).toList();
    log("s length:${s.length}");
    return s;
  }

  List<bool> isDone(Fe2a f) {
    List<bool> answer = [];
    for (final i in getCount(f)) {
      answer.add(i == 1);
    }
    log(answer.toString());
    return answer;
  }

  // ✅ Get the count of fully completed lists
  int getHowManyDone(Fe2a f) {
    return isDone(f).where((done) => done).length;
  }
}

// ✅ Provider
final matlabWesemProvider =
    StateNotifierProvider<MatlabWesemNotifier, Map<Fe2a, List<List<bool>>>>(
        (_) {
  return MatlabWesemNotifier();
});

// {Fe2a.bor3om: [

//     {
//       false,
//       false,
//       matlabBor3om[20],
//       " أتلو سورة قرآنية في إحدى المناسبات": false,
//       matlabBor3om[10]: false,
//       matlabBor3om[14]: false,
//       matlabBor3om[24]: false,
//       "أقف عند ذكر اسم الإمام المهدي ": false,
//       " أتصدق بنية حفظ الإمام ": false,
//       matlabBor3om[7]: false,
//       matlabBor3om[23]: false,
//       matlabBor3om[26]: false,
//       "أشارك في مسيرة عاشورائية": false,
//       " أقدم خدمة في مجالس الكبار سقاية الماء، توزيع محارم، توزيع ضيافة": false,
//       " أمتلك صوتا حسنًا": false,
//       matlabBor3om[43]: false,
//       "انشد نشيدين مع فريق": false,
//       " أنشد في إحدى المناسبات في فوجي": false,
//       " أحسن استعمال ثلاثة أنواع من التلوين": false,
//       " أقتني مجموعة من الأدوات الخاصة بالرسم": false,
//       matlabBor3om[57]: false,
//       matlabBor3om[61]: false,
//       " أعرف بقدرتي على أداء الأدوار المختلفة": false,
//       " أؤدي عملين تمثيليين": false,
//       " أعرف كيفية تنفيذ خمس ألعاب": false,
//       "أدير لعبتين لفريقي": false,
//       "أساهم في فوز فريقي في الألعاب": false,
//       matlabBor3om[53]: false,
//       "اتعرف إلى استعمالات إحدى العقد الكشفية": false,
//       "أدرب اثنين من زملائي على كيفية صناعة عقدة كشفية": false,
//       " أعرف دلالة خمسة من رموز تتبع الأثر": false,
//       " أشارك في نشاط مطبقا ثلاثة من رموز تتبع الأثر": false,
//       " أسمي سبع قطع من أصل عشر في لعبة 'كيم' بمدة ثلاث دقائق بعد ملاحظتها الدقيقة واحدة ":
//           false,
//       " أميز سبعة أشياء من أصل عشرة، وأنا معصوب العينين، من خلال الشم، أو اللمس، أو التذوق":
//           false,
//       " أمير خمسة أصوات من أصل سبعة": false,
//       " أواظب على قراءة قصة، أو مجلة أسبوعيا": false,
//       " أعيد سرد إحدى القصص التي قرأتها بأسلوبي الخاص": false,
//       "أقتني عشر قصص على الأقل، أو أشترك بمجلة مهدي فئة \"أ\"": false,
//       " أزور إحدى المكتبات العامة": false,
//       " أحصل على إحدى المراتب الثلاث الأولى في صفّي على مدى عام كامل": false,
//       " أشارك في نشاط علمي": false,
//       matlabBor3om[76]: false,
//       matlabBor3om[77]: false,
//       " أتحلى بروح رياضية": false,
//       " أنال إحدى الجوائز المدرسية أو الكشفية في إحدى المهرجانات الرياضية":
//           false,
//       " أشارك في مباراة كرة قدم": false,
//       " أجيد التحكم بالكرة": false,
//       " أسجل ثلاثة أهداف على الأقل في مرمى الفريق الآخر": false,
//       " أمتلك دراجة هوائية": false,
//       " أذكر إجراءات السلامة في استعمال الدراجة": false,
//       " اجتاز مسافة مائة وخمسين مترا دون توقف": false,
//       " أشارك في سباق جري ضمن فوجي": false,
//       " أجري مسافة خمسين مترا بشكل مستقيم دون توقف": false,
//       " أجري مسافة خمسة وعشرين مترا جريا متعرجا": false,
//       " أذكر ثلاثة من إجراءات السلامة أثناء السباحة": false,
//       "أسبح مسافة عشرين مترا": false,
//       " أطفو على الماء لمدة ثلاثين ثانية": false,
//       matlabBor3om[36]: false,
//       matlabBor3om[38]: false,
//       matlabBor3om[41]: false,
//       matlabBor3om[42]: false,
//       matlabBor3om[45]: false,
//       "أحفظ نشيدًا حول المقاومة": false,
//       matlabBor3om[89]: false,
//       matlabBor3om[92]: false,
//       matlabBor3om[93]: false,
//       " أصنع عملا فنيا بسيطا من مخلفات البيئة": false,
//       " أهتم بمساعدة الآخرين وخدمتهم": false,
//       " أقدم ثلاث خدمات للمحتاجين عجزة، فقراء ذوي احتياجات خاصة": false,
//       matlabBor3om[88]: false,
//       " أبادر إلى مساعدة أحد زملائي في الفريق": false,
//       "أشارك بأنشطة فريقي بفعالية": false,
//       " أساعد قائدي في الفريق": false,
//       " أعرف بأخلاقي الحسنة": false,
//       "أتعامل مع الآخرين بطريقة لائقة": false,
//       matlabBor3om[83]: false,
//       matlabBor3om[84]: false,
//       matlabBor3om[34]: false,
//       matlabBor3om[69]: false,
//       matlabBor3om[70]: false,
//       matlabBor3om[72]: false,
//       matlabBor3om[82]: false,
//       matlabBor3om[85]: false,
//       "أساعد والدتي في ثلاثة من أعمال المنزل": false,
//       matlabBor3om[87]: false

//   }

//   ,List.filled(wesemBor3om.length, 0)]
// };