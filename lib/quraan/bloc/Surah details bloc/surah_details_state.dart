import 'package:equatable/equatable.dart';
import 'package:quraan_kareem/quraan/model/surah_details_model.dart';

abstract class SurahDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class SurahDetailsInitial extends SurahDetailsState {}

class SurahDetailsLoading extends SurahDetailsState {}

class SurahDetailsLoaded extends SurahDetailsState {
  final SurahDetails surahDetails;

  SurahDetailsLoaded(this.surahDetails);

  @override
  List<Object> get props => [surahDetails];
}

class SurahDetailsError extends SurahDetailsState {
  final String message;

  SurahDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
