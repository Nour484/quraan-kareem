import 'package:equatable/equatable.dart';

abstract class EditionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchEdition extends EditionEvent {
  final String editionType;

  FetchEdition(this.editionType);

  @override
  List<Object> get props => [editionType];
}
