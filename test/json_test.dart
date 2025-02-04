import 'package:flutter_test/flutter_test.dart';
import 'package:quraan_kareem/json_parsing.dart';

void main() {
  test("parse Surahs.json", () {
    const jsonMap = """[
      {
        "number": 1,
        "name": "سُورَةُ ٱلْفَاتِحَةِ",
        "englishName": "Al-Faatiha",
        "englishNameTranslation": "The Opening",
        "numberOfAyahs": 7,
        "revelationType": "Meccan"
      },
      {
        "number": 2,
        "name": "سُورَةُ البَقَرَةِ",
        "englishName": "Al-Baqara",
        "englishNameTranslation": "The Cow",
        "numberOfAyahs": 286,
        "revelationType": "Medinan"
      }
     
    ]""";

    expect(
      parseSurahs2(jsonMap),
      {
        "number": 1,
        "name": "سُورَةُ ٱلْفَاتِحَةِ",
        "englishName": "Al-Faatiha",
        "englishNameTranslation": "The Opening",
        "numberOfAyahs": 7,
        "revelationType": "Meccan"
      },
    );
  });

  // test(
  //   "parse surah ",
  //   () {
  //     const surah = [];
  //     expect(parseSurah(surah)., matcher);
  //   },
  // );
}
