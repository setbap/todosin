part of 'edit_todo_bloc.dart';

abstract class EditTodoEvent extends Equatable {
  const EditTodoEvent();

  @override
  List<Object> get props => [];
}

class EditTodoTaskChangeEvent extends EditTodoEvent {
  const EditTodoTaskChangeEvent(this.task);

  final String task;

  @override
  List<Object> get props => [task];
}

class EditTodoNoteChangeEvent extends EditTodoEvent {
  const EditTodoNoteChangeEvent(this.note);

  final String note;

  @override
  List<Object> get props => [note];
}

class EditTodoStartDateChangeEvent extends EditTodoEvent {
  const EditTodoStartDateChangeEvent(this.startDate);

  final DateTime startDate;

  @override
  List<Object> get props => [startDate];
}

class EditTodoEndDateChangeEvent extends EditTodoEvent {
  const EditTodoEndDateChangeEvent(this.endDate);

  final DateTime endDate;

  @override
  List<Object> get props => [endDate];
}

class EditTodoColorChangeEvent extends EditTodoEvent {
  const EditTodoColorChangeEvent(this.color);

  final int color;

  @override
  List<Object> get props => [color];
}

class EditTodoTodoPriorityChangeEvent extends EditTodoEvent {
  const EditTodoTodoPriorityChangeEvent(this.priority);

  final TodoPriority priority;

  @override
  List<Object> get props => [priority];
}

class EditTodoTodoStatusChangeEvent extends EditTodoEvent {
  const EditTodoTodoStatusChangeEvent(this.status);

  final TodoStatus status;

  @override
  List<Object> get props => [status];
}

class EditTodoGroupChangeEvent extends EditTodoEvent {
  const EditTodoGroupChangeEvent(this.group);

  final String group;

  @override
  List<Object> get props => [group];
}

class EditTodoSubmitEvent extends EditTodoEvent {
  final String id;

  const EditTodoSubmitEvent({this.id});

  @override
  List<Object> get props => [id];
}

class EditTodoInitialWithTodoEvent extends EditTodoEvent {
  const EditTodoInitialWithTodoEvent(this.todo);

  final TodoModel todo;

  @override
  List<Object> get props => [todo];
}
