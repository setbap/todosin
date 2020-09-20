part of 'retrieve_color_bloc.dart';

abstract class RetrieveGroupEvent extends Equatable {
  const RetrieveGroupEvent();

  @override
  List<Object> get props => [];
}

class RetrieveGroupAddGroupEvent extends RetrieveGroupEvent {
  final Color color;
  final String name;

  const RetrieveGroupAddGroupEvent(this.color, this.name);

  @override
  List<Object> get props => [color, name];
}

class RetrieveGroupUpdateColorEvent extends RetrieveGroupEvent {
  final GroupModel model;

  const RetrieveGroupUpdateColorEvent(this.model);

  @override
  List<Object> get props => [model];
}

class RetrieveGroupGetAllGroupEvent extends RetrieveGroupEvent {}

class RetrieveGroupDeleteGroupEvent extends RetrieveGroupEvent {
  final GroupModel model;

  const RetrieveGroupDeleteGroupEvent(this.model);

  @override
  List<Object> get props => [model];
}
