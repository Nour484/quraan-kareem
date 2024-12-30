import 'package:equatable/equatable.dart';
import 'package:quraan_kareem/quraan/model/ayahs.model.dart';
import 'package:quraan_kareem/quraan/model/edition.dart';

class SurahDetails extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final String revelationType;
  final int numberOfAyahs;
  final List<Ayah> ayahs;
  final Edition edition;

  const SurahDetails({
    required this.edition,
    required this.ayahs,
    required this.number,
    required this.name,
    required this.englishName,
    required this.revelationType,
    required this.numberOfAyahs,
  });

  @override
  List<Object> get props => [
        number,
        name,
        englishName,
        revelationType,
        numberOfAyahs,
        ayahs,
        edition
      ];

  factory SurahDetails.fromJson(Map<String, dynamic> json) {
    var ayahsJson = json['ayahs'] as List;
    List<Ayah> ayahList = ayahsJson.map((i) => Ayah.fromJson(i)).toList();
    return SurahDetails(
      edition: Edition.fromJson(json['edition']),
      ayahs: ayahList,
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      revelationType: json['revelationType'],
      numberOfAyahs: json['ayahs'].length,
    );
  }
}
