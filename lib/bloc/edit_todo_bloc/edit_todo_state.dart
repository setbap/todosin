part of 'edit_todo_bloc.dart';

class EditTodoState extends Equatable {
  const EditTodoState({
    this.task,
    this.note,
    this.startDate,
    this.endDate,
    this.color,
    this.groupId,
    this.formzStatus,
    this.priority = TodoPriority.MEDIUM,
    this.status = TodoStatus.TODO,
  });

  final Name task;
  final Name note;
  final MyDate startDate;
  final MyDate endDate;
  final MyColor color;
  final IdValue groupId;
  final TodoPriority priority;
  final TodoStatus status;
  final FormzStatus formzStatus;

  @override
  List<Object> get props {
    return [
      task,
      note,
      startDate,
      endDate,
      color,
      groupId,
      priority,
      status,
      formzStatus,
    ];
  }

  @override
  bool get stringify => true;

  EditTodoState copyWith({
    Name task,
    Name note,
    MyDate startDate,
    MyDate endDate,
    MyColor color,
    IdValue groupId,
    TodoPriority priority,
    TodoStatus status,
    FormzStatus formzStatus,
  }) {
    return EditTodoState(
      task: task ?? this.task,
      note: note ?? this.note,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      color: color ?? this.color,
      groupId: groupId ?? this.groupId,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      formzStatus: formzStatus ?? this.formzStatus,
    );
  }
}
