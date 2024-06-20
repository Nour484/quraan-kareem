import 'package:equatable/equatable.dart';

class SurahDetails extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final String revelationType;
  final int ayahs;

  const SurahDetails({
    required this.number,
    required this.name,
    required this.englishName,
    required this.revelationType,
    required this.ayahs,
  });

  @override
  List<Object> get props => [number, name, englishName, revelationType, ayahs];

  factory SurahDetails.fromJson(Map<String, dynamic> json) {
    return SurahDetails(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      revelationType: json['revelationType'],
      ayahs: json['ayahs'].length,
    );
  }
}
