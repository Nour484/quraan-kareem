// lib/models/surah.dart
import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int number;
  final String name;
  final String englishName;

  const Surah({
    required this.number,
    required this.name,
    required this.englishName,
  });

  @override
  List<Object> get props => [number, name, englishName];

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
    );
  }
}
