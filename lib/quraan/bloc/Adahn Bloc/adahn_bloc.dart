import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_kareem/quraan/bloc/Adahn%20Bloc/adahn_event.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quraan_kareem/quraan/bloc/Adahn%20Bloc/adahn_state.dart';

import '../../model/adahn_model.dart';

class PrayerTimesBloc extends Bloc<PrayerTimesEvent, PrayerTimesState> {
  PrayerTimesBloc() : super(PrayerTimesInitial()) {
    on<FetchPrayerTimes>(_onFetchPrayerTimes);
  }

  void _onFetchPrayerTimes(
      FetchPrayerTimes event, Emitter<PrayerTimesState> emit) async {
    emit(PrayerTimesLoading());

    try {
      final response = await http.get(Uri.parse(
          'https://api.aladhan.com/v1/timings?latitude=${event.latitude}&longitude=${event.longitude}&method=8'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final prayerTimesResponse = PrayerTimesResponse.fromJson(json);
        emit(PrayerTimesLoaded(prayerTimesResponse: prayerTimesResponse));
      } else {
        emit(PrayerTimesError(message: 'Failed to load prayer times'));
      }
    } catch (e) {
      emit(PrayerTimesError(message: e.toString()));
    }
  }
}
