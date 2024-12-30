// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Edition> _$editionSerializer = new _$EditionSerializer();

class _$EditionSerializer implements StructuredSerializer<Edition> {
  @override
  final Iterable<Type> types = const [Edition, _$Edition];
  @override
  final String wireName = 'Edition';

  @override
  Iterable<Object?> serialize(Serializers serializers, Edition object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'identifier',
      serializers.serialize(object.identifier,
          specifiedType: const FullType(String)),
      'language',
      serializers.serialize(object.language,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'englishName',
      serializers.serialize(object.englishName,
          specifiedType: const FullType(String)),
      'format',
      serializers.serialize(object.format,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'direction',
      serializers.serialize(object.direction,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Edition deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EditionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'identifier':
          result.identifier = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'englishName':
          result.englishName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'format':
          result.format = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'direction':
          result.direction = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Edition extends Edition {
  @override
  final String identifier;
  @override
  final String language;
  @override
  final String name;
  @override
  final String englishName;
  @override
  final String format;
  @override
  final String type;
  @override
  final String direction;

  factory _$Edition([void Function(EditionBuilder)? updates]) =>
      (new EditionBuilder()..update(updates))._build();

  _$Edition._(
      {required this.identifier,
      required this.language,
      required this.name,
      required this.englishName,
      required this.format,
      required this.type,
      required this.direction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(identifier, r'Edition', 'identifier');
    BuiltValueNullFieldError.checkNotNull(language, r'Edition', 'language');
    BuiltValueNullFieldError.checkNotNull(name, r'Edition', 'name');
    BuiltValueNullFieldError.checkNotNull(
        englishName, r'Edition', 'englishName');
    BuiltValueNullFieldError.checkNotNull(format, r'Edition', 'format');
    BuiltValueNullFieldError.checkNotNull(type, r'Edition', 'type');
    BuiltValueNullFieldError.checkNotNull(direction, r'Edition', 'direction');
  }

  @override
  Edition rebuild(void Function(EditionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditionBuilder toBuilder() => new EditionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Edition &&
        identifier == other.identifier &&
        language == other.language &&
        name == other.name &&
        englishName == other.englishName &&
        format == other.format &&
        type == other.type &&
        direction == other.direction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, identifier.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, englishName.hashCode);
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, direction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Edition')
          ..add('identifier', identifier)
          ..add('language', language)
          ..add('name', name)
          ..add('englishName', englishName)
          ..add('format', format)
          ..add('type', type)
          ..add('direction', direction))
        .toString();
  }
}

class EditionBuilder implements Builder<Edition, EditionBuilder> {
  _$Edition? _$v;

  String? _identifier;
  String? get identifier => _$this._identifier;
  set identifier(String? identifier) => _$this._identifier = identifier;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _englishName;
  String? get englishName => _$this._englishName;
  set englishName(String? englishName) => _$this._englishName = englishName;

  String? _format;
  String? get format => _$this._format;
  set format(String? format) => _$this._format = format;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _direction;
  String? get direction => _$this._direction;
  set direction(String? direction) => _$this._direction = direction;

  EditionBuilder();

  EditionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _identifier = $v.identifier;
      _language = $v.language;
      _name = $v.name;
      _englishName = $v.englishName;
      _format = $v.format;
      _type = $v.type;
      _direction = $v.direction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Edition other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Edition;
  }

  @override
  void update(void Function(EditionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Edition build() => _build();

  _$Edition _build() {
    final _$result = _$v ??
        new _$Edition._(
          identifier: BuiltValueNullFieldError.checkNotNull(
              identifier, r'Edition', 'identifier'),
          language: BuiltValueNullFieldError.checkNotNull(
              language, r'Edition', 'language'),
          name: BuiltValueNullFieldError.checkNotNull(name, r'Edition', 'name'),
          englishName: BuiltValueNullFieldError.checkNotNull(
              englishName, r'Edition', 'englishName'),
          format: BuiltValueNullFieldError.checkNotNull(
              format, r'Edition', 'format'),
          type: BuiltValueNullFieldError.checkNotNull(type, r'Edition', 'type'),
          direction: BuiltValueNullFieldError.checkNotNull(
              direction, r'Edition', 'direction'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
