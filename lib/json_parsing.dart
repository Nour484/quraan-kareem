import 'dart:convert' as json;

List<Map<String, dynamic>> parseSurahs(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  final listOfIds = List<Map<String, dynamic>>.from(parsed);
  return listOfIds;
}
