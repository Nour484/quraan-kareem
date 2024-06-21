import 'package:equatable/equatable.dart';
import 'package:quraan_kareem/quraan/model/edition_model.dart';
import '../../model/surah_model.dart';

abstract class EditionState extends Equatable {
  @override
  List<Object> get props => [];
}

class EditionInitial extends EditionState {}

class EditionLoading extends EditionState {}

class EditionLoaded extends EditionState {
  final List<Edition> edition;

  EditionLoaded(this.edition);

  @override
  List<Object> get props => [edition];
}

class EditionError extends EditionState {
  final String message;

  EditionError(this.message);

  @override
  List<Object> get props => [message];
}
