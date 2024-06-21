import 'package:equatable/equatable.dart';
import 'package:quraan_kareem/quraan/model/adahn_model.dart';

abstract class PrayerTimesState extends Equatable {
  const PrayerTimesState();

  @override
  List<Object> get props => [];
}

class PrayerTimesInitial extends PrayerTimesState {}

class PrayerTimesLoading extends PrayerTimesState {}

class PrayerTimesLoaded extends PrayerTimesState {
  final PrayerTimesResponse prayerTimesResponse;

  const PrayerTimesLoaded({required this.prayerTimesResponse});

  @override
  List<Object> get props => [prayerTimesResponse];
}

class PrayerTimesError extends PrayerTimesState {
  final String message;

  const PrayerTimesError({required this.message});

  @override
  List<Object> get props => [message];
}
