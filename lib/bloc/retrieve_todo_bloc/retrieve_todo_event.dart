part of 'retrieve_todo_bloc.dart';

abstract class RetrieveTodoEvent extends Equatable {
  const RetrieveTodoEvent();

  @override
  List<Object> get props => [];
}

class RetrieveTodoAddTodoEvent extends RetrieveTodoEvent {
  final String note;
  final String task;
  final DateTime startDate;
  final DateTime endDate;
  final Color color;
  final String groupId;
  final TodoStatus status;
  final TodoPriority priority;

  const RetrieveTodoAddTodoEvent({
    @required this.note,
    @required this.task,
    @required this.startDate,
    @required this.endDate,
    @required this.color,
    @required this.groupId,
    @required this.status,
    @required this.priority,
  });

  @override
  List<Object> get props => [
        note,
        task,
        startDate,
        endDate,
        groupId,
        priority,
        status,
        color,
      ];
}

class RetrieveTodoUpdateTodoEvent extends RetrieveTodoEvent {
  final TodoModel model;

  const RetrieveTodoUpdateTodoEvent(this.model);

  @override
  List<Object> get props => [model];
}

class RetrieveTodoGetAllTodoEvent extends RetrieveTodoEvent {}

class RetrieveTodoDeleteTodoEvent extends RetrieveTodoEvent {
  final TodoModel model;

  const RetrieveTodoDeleteTodoEvent({this.model});

  @override
  List<Object> get props => [model];
}
