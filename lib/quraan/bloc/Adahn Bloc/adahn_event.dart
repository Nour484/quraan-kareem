import 'package:equatable/equatable.dart';

abstract class PrayerTimesEvent extends Equatable {
  const PrayerTimesEvent();

  @override
  List<Object> get props => [];
}

class FetchPrayerTimes extends PrayerTimesEvent {
  final double latitude;
  final double longitude;

  const FetchPrayerTimes({required this.latitude, required this.longitude});

  @override
  List<Object> get props => [latitude, longitude];
}
