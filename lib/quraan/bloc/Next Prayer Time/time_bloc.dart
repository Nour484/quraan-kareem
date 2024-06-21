import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

// PrayerTimes class to hold the data
class PrayerTimes {
  final Map<String, DateTime> times;

  PrayerTimes(this.times);

  // Function to convert map of string times to map of DateTime
  factory PrayerTimes.fromJson(Map<String, String> json) {
    Map<String, DateTime> times = {};
    json.forEach((key, value) {
      times[key] = convertStringToDateTime(value);
    });
    return PrayerTimes(times);
  }
}

// Function to convert string time to DateTime
DateTime convertStringToDateTime(String timeString) {
  DateTime now = DateTime.now();
  List<String> parts = timeString.split(':');
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);
  return DateTime(now.year, now.month, now.day, hour, minute);
}
// Function to fetch or initialize prayer times (mocked for example)
Future<PrayerTimes> fetchPrayerTimes() async {
  await Future.delayed(Duration(seconds: 2)); // Simulate API delay
  Map<String, String> prayerTimesString = {
    'Fajr': '04:08',
    'Sunrise': '05:57',
    'Dhuhr': '13:02',
    'Asr': '16:41',
    'Sunset': '20:07',
    'Maghrib': '20:07',
    'Isha': '21:37',
  };
  return PrayerTimes.fromJson(prayerTimesString);
}

