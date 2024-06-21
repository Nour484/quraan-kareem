import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:quraan_kareem/quraan/bloc/Edition%20Bloc/edition_event.dart';
import 'package:quraan_kareem/quraan/bloc/Edition%20Bloc/edition_state.dart';

import 'dart:convert';

import '../../model/edition_model.dart';

class EditionBloc extends Bloc<EditionEvent, EditionState> {
  EditionBloc() : super(EditionInitial()) {
    on<FetchEdition>(_onFetchEdition);
  }

  void _onFetchEdition(FetchEdition event, Emitter<EditionState> emit) async {
    emit(EditionLoading());
    try {
      final response = await http.get(Uri.parse(
          'https://api.alquran.cloud/v1/edition/type/${event.editionType}'));
      if (response.statusCode == 200) {
        final List surahJson = json.decode(response.body)['data'];
        final surahs = surahJson.map((json) => Edition.fromJson(json)).toList();
        emit(EditionLoaded(surahs));
      } else {
        emit(EditionError('Failed to load surahs'));
      }
    } catch (e) {
      emit(EditionError(e.toString()));
    }
  }
}
