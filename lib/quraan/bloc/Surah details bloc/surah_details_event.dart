import 'package:equatable/equatable.dart';

abstract class SurahDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSurahDetails extends SurahDetailsEvent {
  final int surahId; 
   final String  identifier;

  FetchSurahDetails(this.surahId , this .identifier);

  @override
  List<Object> get props => [surahId , identifier];
}
