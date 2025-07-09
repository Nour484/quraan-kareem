import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:quraan_kareem/quraan/bloc/Surah%20list%20Bloc/surah_event.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20list%20Bloc/surahs_state.dart';
import 'dart:convert';

import 'package:quraan_kareem/quraan/model/surah_model.dart';

class SurahListBloc extends Bloc<SurahListEvent, SurahListState> {
  SurahListBloc() : super(SurahListInitial()) {
    on<FetchSurahList>(_onFetchSurahList);
  }

  void _onFetchSurahList(
      FetchSurahList event, Emitter<SurahListState> emit) async {
    emit(SurahListLoading());
    try {
      final response =
          await http.get(Uri.parse('https://api.alquran.cloud/v1/surah'));
      if (response.statusCode == 200) {
        final List surahJson = json.decode(response.body)['data'];
        final surahs = surahJson.map((json) => Surah.fromJson(json)).toList();
        emit(SurahListLoaded(surahs));
      } else {
        emit(SurahListError('Failed to load surahs'));
      }
    } catch (e) {
      emit(SurahListError(e.toString()));
    }
  }
}
