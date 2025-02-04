import 'dart:convert' as json;

import 'package:quraan_kareem/buit_value_test/model/serializers.dart';
import 'package:quraan_kareem/quraan/model/ayahs.model.dart';

import 'buit_value_test/model/quraan.dart';

List<Map<String, dynamic>> parseSurahs(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  final listOfAyat = List<Map<String, dynamic>>.from(parsed);
  return listOfAyat;
}

Surahs parseSurahs2(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  Surahs surahs =
      serializers.deserializeWith(Surahs.serializer, parsed) as Surahs;
  return surahs;
}
