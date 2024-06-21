class Timings {
  final DateTime fajr;
  final DateTime sunrise;
  final DateTime dhuhr;
  final DateTime asr;
  final DateTime sunset;
  final DateTime maghrib;
  final DateTime isha;
  final DateTime imsak;
  final DateTime midnight;
  final DateTime firstthird;
  final DateTime lastthird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstthird,
    required this.lastthird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      fajr: DateTime.parse("2024-06-21 " + json['Fajr'] + ":00"),
      sunrise: DateTime.parse("2024-06-21 " + json['Sunrise'] + ":00"),
      dhuhr: DateTime.parse("2024-06-21 " + json['Dhuhr'] + ":00"),
      asr: DateTime.parse("2024-06-21 " + json['Asr'] + ":00"),
      sunset: DateTime.parse("2024-06-21 " + json['Sunset'] + ":00"),
      maghrib: DateTime.parse("2024-06-21 " + json['Maghrib'] + ":00"),
      isha: DateTime.parse("2024-06-21 " + json['Isha'] + ":00"),
      imsak: DateTime.parse("2024-06-21 " + json['Imsak'] + ":00"),
      midnight: DateTime.parse("2024-06-21 " + json['Midnight'] + ":00"),
      firstthird: DateTime.parse("2024-06-21 " + json['Firstthird'] + ":00"),
      lastthird: DateTime.parse("2024-06-21 " + json['Lastthird'] + ":00"),
    );
  }
}
