import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:quraan_kareem/quraan/bloc/Surah%20list%20Bloc/surah_event.dart';
import 'package:quraan_kareem/quraan/bloc/tranlation%20Bloc/translation_bloc.dart';
import 'package:quraan_kareem/quraan/model/surah_model.dart';

import 'fetch_surah_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  late MockClient mockClient;

  late TranslationBloc myBloc;

  setUp(() {
    mockClient = MockClient();
  });

  final client = MockClient();

  final data = json.encode({
    'number': 1,
    'text': "First add test",
  });
  when(test("fetch ", () async {
    final response = await client.get(Uri.parse(
        "https://api.alquran.cloud/v1/surah/1/editions/en.ahmedali,en.transliteration,ar.muyassar"));
    if (response.statusCode == 200) {
      List body = json.decode(response.body);
      final List<Surah> list =
          body.map((item) => Surah.fromJson(item)).toList();

      return list;
    }
  })).thenAnswer((_) => http.Response(data, 200));




  

}
