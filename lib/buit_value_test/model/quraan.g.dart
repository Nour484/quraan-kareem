// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quraan.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Surahs> _$surahsSerializer = new _$SurahsSerializer();
Serializer<Ayahs> _$ayahsSerializer = new _$AyahsSerializer();

class _$SurahsSerializer implements StructuredSerializer<Surahs> {
  @override
  final Iterable<Type> types = const [Surahs, _$Surahs];
  @override
  final String wireName = 'Surahs';

  @override
  Iterable<Object?> serialize(Serializers serializers, Surahs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'number',
      serializers.serialize(object.number, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'englishName',
      serializers.serialize(object.englishName,
          specifiedType: const FullType(String)),
      'englishNameTranslation',
      serializers.serialize(object.englishNameTranslation,
          specifiedType: const FullType(String)),
      'revelationType',
      serializers.serialize(object.revelationType,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Surahs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SurahsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'englishName':
          result.englishName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'englishNameTranslation':
          result.englishNameTranslation = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'revelationType':
          result.revelationType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AyahsSerializer implements StructuredSerializer<Ayahs> {
  @override
  final Iterable<Type> types = const [Ayahs, _$Ayahs];
  @override
  final String wireName = 'Ayahs';

  @override
  Iterable<Object?> serialize(Serializers serializers, Ayahs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'sajda',
      serializers.serialize(object.sajda, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Ayahs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AyahsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'sajda':
          result.sajda = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Surahs extends Surahs {
  @override
  final int number;
  @override
  final String name;
  @override
  final String englishName;
  @override
  final String englishNameTranslation;
  @override
  final String revelationType;

  factory _$Surahs([void Function(SurahsBuilder)? updates]) =>
      (new SurahsBuilder()..update(updates))._build();

  _$Surahs._(
      {required this.number,
      required this.name,
      required this.englishName,
      required this.englishNameTranslation,
      required this.revelationType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(number, r'Surahs', 'number');
    BuiltValueNullFieldError.checkNotNull(name, r'Surahs', 'name');
    BuiltValueNullFieldError.checkNotNull(
        englishName, r'Surahs', 'englishName');
    BuiltValueNullFieldError.checkNotNull(
        englishNameTranslation, r'Surahs', 'englishNameTranslation');
    BuiltValueNullFieldError.checkNotNull(
        revelationType, r'Surahs', 'revelationType');
  }

  @override
  Surahs rebuild(void Function(SurahsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SurahsBuilder toBuilder() => new SurahsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Surahs &&
        number == other.number &&
        name == other.name &&
        englishName == other.englishName &&
        englishNameTranslation == other.englishNameTranslation &&
        revelationType == other.revelationType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, number.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, englishName.hashCode);
    _$hash = $jc(_$hash, englishNameTranslation.hashCode);
    _$hash = $jc(_$hash, revelationType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Surahs')
          ..add('number', number)
          ..add('name', name)
          ..add('englishName', englishName)
          ..add('englishNameTranslation', englishNameTranslation)
          ..add('revelationType', revelationType))
        .toString();
  }
}

class SurahsBuilder implements Builder<Surahs, SurahsBuilder> {
  _$Surahs? _$v;

  int? _number;
  int? get number => _$this._number;
  set number(int? number) => _$this._number = number;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _englishName;
  String? get englishName => _$this._englishName;
  set englishName(String? englishName) => _$this._englishName = englishName;

  String? _englishNameTranslation;
  String? get englishNameTranslation => _$this._englishNameTranslation;
  set englishNameTranslation(String? englishNameTranslation) =>
      _$this._englishNameTranslation = englishNameTranslation;

  String? _revelationType;
  String? get revelationType => _$this._revelationType;
  set revelationType(String? revelationType) =>
      _$this._revelationType = revelationType;

  SurahsBuilder();

  SurahsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _number = $v.number;
      _name = $v.name;
      _englishName = $v.englishName;
      _englishNameTranslation = $v.englishNameTranslation;
      _revelationType = $v.revelationType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Surahs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Surahs;
  }

  @override
  void update(void Function(SurahsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Surahs build() => _build();

  _$Surahs _build() {
    final _$result = _$v ??
        new _$Surahs._(
          number: BuiltValueNullFieldError.checkNotNull(
              number, r'Surahs', 'number'),
          name: BuiltValueNullFieldError.checkNotNull(name, r'Surahs', 'name'),
          englishName: BuiltValueNullFieldError.checkNotNull(
              englishName, r'Surahs', 'englishName'),
          englishNameTranslation: BuiltValueNullFieldError.checkNotNull(
              englishNameTranslation, r'Surahs', 'englishNameTranslation'),
          revelationType: BuiltValueNullFieldError.checkNotNull(
              revelationType, r'Surahs', 'revelationType'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$Ayahs extends Ayahs {
  @override
  final String text;
  @override
  final int page;
  @override
  final bool sajda;

  factory _$Ayahs([void Function(AyahsBuilder)? updates]) =>
      (new AyahsBuilder()..update(updates))._build();

  _$Ayahs._({required this.text, required this.page, required this.sajda})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(text, r'Ayahs', 'text');
    BuiltValueNullFieldError.checkNotNull(page, r'Ayahs', 'page');
    BuiltValueNullFieldError.checkNotNull(sajda, r'Ayahs', 'sajda');
  }

  @override
  Ayahs rebuild(void Function(AyahsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AyahsBuilder toBuilder() => new AyahsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Ayahs &&
        text == other.text &&
        page == other.page &&
        sajda == other.sajda;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, sajda.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Ayahs')
          ..add('text', text)
          ..add('page', page)
          ..add('sajda', sajda))
        .toString();
  }
}

class AyahsBuilder implements Builder<Ayahs, AyahsBuilder> {
  _$Ayahs? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  bool? _sajda;
  bool? get sajda => _$this._sajda;
  set sajda(bool? sajda) => _$this._sajda = sajda;

  AyahsBuilder();

  AyahsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _page = $v.page;
      _sajda = $v.sajda;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Ayahs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Ayahs;
  }

  @override
  void update(void Function(AyahsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Ayahs build() => _build();

  _$Ayahs _build() {
    final _$result = _$v ??
        new _$Ayahs._(
          text: BuiltValueNullFieldError.checkNotNull(text, r'Ayahs', 'text'),
          page: BuiltValueNullFieldError.checkNotNull(page, r'Ayahs', 'page'),
          sajda:
              BuiltValueNullFieldError.checkNotNull(sajda, r'Ayahs', 'sajda'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
