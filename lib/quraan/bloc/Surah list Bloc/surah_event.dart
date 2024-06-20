import 'package:equatable/equatable.dart';

abstract class SurahListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSurahList extends SurahListEvent {}
