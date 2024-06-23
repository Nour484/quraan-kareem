import 'package:equatable/equatable.dart';

abstract class TranslationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSurahTranslation extends TranslationEvent {
  final int surahId; 
   final String  identifier;

  FetchSurahTranslation(this.surahId , this .identifier);

  @override
  List<Object> get props => [surahId , identifier];
}
