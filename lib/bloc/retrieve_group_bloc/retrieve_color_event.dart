part of 'retrieve_color_bloc.dart';

abstract class RetrieveColorEvent extends Equatable {
  const RetrieveColorEvent();

  @override
  List<Object> get props => [];
}

class RetrieveColorAddColorEvent extends RetrieveColorEvent {
  final Color color;
  final String colorName;

  const RetrieveColorAddColorEvent(this.color, this.colorName);

  @override
  List<Object> get props => [color, colorName];
}

class RetrieveColorUpdateColorEvent extends RetrieveColorEvent {
  final ColorModel model;

  const RetrieveColorUpdateColorEvent(this.model);

  @override
  List<Object> get props => [model];
}

class RetrieveColorGetAllColorEvent extends RetrieveColorEvent {}

class RetrieveColorDeleteColorEvent extends RetrieveColorEvent {
  final ColorModel model;

  const RetrieveColorDeleteColorEvent(this.model);

  @override
  List<Object> get props => [model];
}
