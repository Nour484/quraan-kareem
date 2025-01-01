import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'quraan.g.dart';

abstract class Surahs implements Built<Surahs, SurahsBuilder> {
  int get number;
  String get name;
  String get englishName;
  String get englishNameTranslation;
  String get revelationType;

  factory Surahs([void Function(SurahsBuilder) updates]) = _$Surahs;
  Surahs._();

  static Serializer<Surahs> get serializer => _$surahsSerializer;
}

abstract class Ayahs implements Built<Ayahs, AyahsBuilder> {
  String get text;
  int get page;

  bool get sajda;

  factory Ayahs([void Function(AyahsBuilder) updates]) = _$Ayahs;
  Ayahs._();

  static Serializer<Ayahs> get serializer => _$ayahsSerializer;
}
