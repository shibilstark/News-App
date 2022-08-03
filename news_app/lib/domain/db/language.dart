import 'package:hive_flutter/adapters.dart';
part 'language.g.dart';

@HiveType(typeId: 1)
class NewsLanguage {
  @HiveField(0)
  String currentLang;

  NewsLanguage({required this.currentLang});
}

class DbFunctions {
  static Future<String> saveCurrentLanguage(int lanCode) async {
    final _db = await Hive.openBox<NewsLanguage>("lang");

    await _db.clear();
    await _db.add(NewsLanguage(currentLang: langs[lanCode]));

    return langs[lanCode];
  }

  static Future<String?> getCurrentLanguage() async {
    final _db = await Hive.openBox<NewsLanguage>("lang");

    if (_db.isEmpty) {
      return null;
    }
    return _db.values.first.currentLang;
  }
}

final langs = <String>[
  "ae",
  "us",
  "in",
  "ua",
  "ru",
  "ca",
];
