import 'package:equatable/equatable.dart';
import '../../model/surah_model.dart';

abstract class SurahListState extends Equatable {
  @override
  List<Object> get props => [];
}

class SurahListInitial extends SurahListState {}

class SurahListLoading extends SurahListState {}

class SurahListLoaded extends SurahListState {
  final List<Surah> surahs;

  SurahListLoaded(this.surahs);

  @override
  List<Object> get props => [surahs];
}

class SurahListError extends SurahListState {
  final String message;

  SurahListError(this.message);

  @override
  List<Object> get props => [message];
}
