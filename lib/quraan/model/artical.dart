 class Edition{
  final String identifier;
  final String language;
  final String name;
  final String englishName;
  final String format;
  final String type;
  final String direction;

  const Edition({
    required this.identifier,
    required this.language,
    required this.format,
    required this.type,
    required this.direction,
    required this.name,
    required this.englishName,
  });
}