import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:quraan_kareem/quraan/model/surah_details_model.dart';
import 'dart:convert';
import 'surah_details_event.dart';
import 'surah_details_state.dart';

class SurahDetailsBloc extends Bloc<SurahDetailsEvent, SurahDetailsState> {
  SurahDetailsBloc() : super(SurahDetailsInitial()) {
    on<FetchSurahDetails>(_onFetchSurahDetails);
  }

  void _onFetchSurahDetails(
      FetchSurahDetails event, Emitter<SurahDetailsState> emit) async {
    emit(SurahDetailsLoading());
    try {
      final response = await http.get(Uri.parse(
          //" https://api.alquran.cloud/v1/surah/${event.surahId}/editions/quran-uthmani,${event.identifier}"
          'https://api.alquran.cloud/v1/surah/${event.surahId}/${event.identifier}'));
      if (response.statusCode == 200) {
        final surahDetailsJson = json.decode(response.body)['data'];
        final surahDetails = SurahDetails.fromJson(surahDetailsJson);
        emit(SurahDetailsLoaded(surahDetails));
      } else {
        emit(SurahDetailsError('Failed to load surah details'));
      }
    } catch (e) {
      emit(SurahDetailsError(e.toString()));
    }
  }
}
