import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quraan_kareem/buit_value_test/model/quraan.dart';
import 'package:quraan_kareem/buit_value_test/model/serializers.dart';

class QuranApiService {
  final String baseUrl = "https://api.alquran.cloud/v1";

  Future<List<Surahs>> fetchSurahs() async {
    final response = await http.get(Uri.parse("$baseUrl/surah"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];

      return data.map((json) {
        return serializers.deserializeWith(Surahs.serializer, json)!;
      }).toList();
    } else {
      throw Exception("Failed to load Surahs");
    }
  }

  Future<List<Ayahs>> fetchAyahs(int surahNumber) async {
    final response = await http.get(Uri.parse("$baseUrl/surah/$surahNumber"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data']['ayahs'] as List<dynamic>;

      // Deserialize list of Ayahs using Built Value
      return data
          .map((jsonItem) =>
              serializers.deserializeWith(Ayahs.serializer, jsonItem))
          .whereType<Ayahs>()
          .toList();
    } else {
      throw Exception("Failed to load Ayahs");
    }
  }
}
