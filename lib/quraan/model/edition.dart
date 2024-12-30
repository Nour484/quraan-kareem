// lib/models/surah.dart
// import 'package:equatable/equatable.dart';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'edition.g.dart';

abstract class Edition implements Built<Edition, EditionBuilder> {
  String get identifier;
  String get language;
  String get name;
  String get englishName;
  String get format;
  String get type;
  String get direction;
  Edition._();

  static Serializer<Edition> get serializer => _$editionSerializer;

  factory Edition([updates(EditionBuilder e)]) = _$Edition;

  // final String identifier;
  // final String language;
  // final String name;
  // final String englishName;
  // final String format;
  // final String type;
  // final String direction;

  // const Edition({
  //   required this.identifier,
  //   required this.language,
  //   required this.format,
  //   required this.type,
  //   required this.direction,
  //   required this.name,
  //   required this.englishName,
  // });

  // @override
  // List<Object> get props =>
  //     [identifier, language, format, type, direction, name, englishName];

  // factory Edition.fromJson(Map<String, dynamic> json) {
  //   return Edition(
  //     name: json['name'],
  //     englishName: json['englishName'],
  //     identifier: json['identifier'],
  //     language: json['language'],
  //     format: json['format'],
  //     type: json['type'],
  //     direction: json['direction'] ?? "",
  //   );
  // }
}
