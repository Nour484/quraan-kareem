// lib/models/surah.dart
// import 'package:equatable/equatable.dart';

// import 'package:built_collection/built_collection.dart';
// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
import 'package:equatable/equatable.dart';

class Edition  extends Equatable{
  final String identifier;
  final String language;
  final String name;
  final String englishName;
  final String format;
  final String type;
  final String direction;

  const Edition({
    required this.identifier,
    required this.language,
    required this.format,
    required this.type,
    required this.direction,
    required this.name,
    required this.englishName,
  });

  @override
  List<Object> get props =>
      [identifier, language, format, type, direction, name, englishName];

  factory Edition.fromJson(Map<String, dynamic> json) {
    return Edition(
      name: json['name'],
      englishName: json['englishName'],
      identifier: json['identifier'],
      language: json['language'],
      format: json['format'],
      type: json['type'],
      direction: json['direction'] ?? "",
    );
  }
}
