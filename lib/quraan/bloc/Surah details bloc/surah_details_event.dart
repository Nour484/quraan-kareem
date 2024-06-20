import 'package:equatable/equatable.dart';

abstract class SurahDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSurahDetails extends SurahDetailsEvent {
  final int surahId;

  FetchSurahDetails(this.surahId);

  @override
  List<Object> get props => [surahId];
}
