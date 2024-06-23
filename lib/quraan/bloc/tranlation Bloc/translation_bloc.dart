import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:quraan_kareem/quraan/bloc/tranlation%20Bloc/translation_event.dart';
import 'package:quraan_kareem/quraan/bloc/tranlation%20Bloc/translation_state.dart';
import 'package:quraan_kareem/quraan/model/surah_details_model.dart';
import 'dart:convert';

class TranslationBloc extends Bloc<TranslationEvent, TranslationState> {
  TranslationBloc() : super(TranslationInitial()) {
    on<FetchSurahTranslation>(_onFetchSurahDetails);
  }

  void _onFetchSurahDetails(
      FetchSurahTranslation event, Emitter<TranslationState> emit) async {
    emit(TranslationLoading());
    try {
      final response = await http.get(Uri.parse(
          //  " https://api.alquran.cloud/v1/surah/${event.surahId}/editions/quran-uthmani,${event.identifier}"
          'https://api.alquran.cloud/v1/surah/${event.surahId}/editions/${event.identifier},en.ahmedali,en.transliteration'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> surahList = data['data'];
        List<SurahDetails> surahs =
            surahList.map((e) => SurahDetails.fromJson(e)).toList();
        emit(TranslationLoaded(surahs));
      } else {
        emit(TranslationError('Failed to load surah details'));
      }
    } catch (e) {
      emit(TranslationError(e.toString()));
      print('Error: $e');
    }
  }
}
