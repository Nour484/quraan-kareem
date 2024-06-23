import 'package:equatable/equatable.dart';
import 'package:quraan_kareem/quraan/model/surah_details_model.dart';

import '../../model/surah_model.dart';

abstract class TranslationState extends Equatable {
  @override
  List<Object> get props => [];
}

class TranslationInitial extends TranslationState {}

class TranslationLoading extends TranslationState {}

class TranslationLoaded extends TranslationState {
 final List<SurahDetails> surahs;

  TranslationLoaded(this.surahs);

  @override
  List<Object> get props => [surahs];
}

class TranslationError extends TranslationState {
  final String message;

  TranslationError(this.message);

  @override
  List<Object> get props => [message];
}
