import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:todo_repository/repository.dart';
import 'package:todosin/bloc/retrieve_todo_bloc/retrieve_todo_bloc.dart';
import 'package:todosin/model/model.dart';

part 'edit_todo_event.dart';
part 'edit_todo_state.dart';

class EditTodoBloc extends Bloc<EditTodoEvent, EditTodoState> {
  // final HiveTodosRepository _repository;
  final RetrieveTodoBloc _todoBloc;
  EditTodoBloc({TodosRepository repository, RetrieveTodoBloc retrieveTodoBloc})
      :
        // _repository = repository,
        _todoBloc = retrieveTodoBloc,
        super(EditTodoState(
          task: Name.pure(),
          note: Name.pure(),
          groupId: IdValue.pure(),
          startDate: MyDate.pure(),
          endDate: MyDate.pure(),
          color: MyColor.pure(),
        ));

  @override
  Stream<EditTodoState> mapEventToState(
    EditTodoEvent event,
  ) async* {
    if (event is EditTodoTaskChangeEvent) {
      Name newTask = Name.dirty(value: event.task);
      yield state.copyWith(
        task: newTask,
        formzStatus: Formz.validate([
          newTask,
          state.note,
          state.startDate,
          state.endDate,
          state.groupId,
          state.color,
        ]),
      );
    } else if (event is EditTodoNoteChangeEvent) {
      Name newNote = Name.dirty(value: event.note);
      yield state.copyWith(
        note: newNote,
        formzStatus: Formz.validate([
          state.task,
          newNote,
          state.startDate,
          state.endDate,
          state.groupId,
          state.color,
        ]),
      );
    } else if (event is EditTodoStartDateChangeEvent) {
      MyDate newStartDate = MyDate.dirty(value: event.startDate);
      yield state.copyWith(
        startDate: newStartDate,
        formzStatus: Formz.validate([
          state.task,
          state.note,
          newStartDate,
          state.endDate,
          state.groupId,
          state.color,
        ]),
      );
    } else if (event is EditTodoEndDateChangeEvent) {
      MyDate newEndDate = MyDate.dirty(value: event.endDate);
      yield state.copyWith(
        endDate: newEndDate,
        formzStatus: Formz.validate([
          state.task,
          state.note,
          state.startDate,
          newEndDate,
          state.groupId,
          state.color,
        ]),
      );
    } else if (event is EditTodoColorChangeEvent) {
      MyColor newColor = MyColor.dirty(value: Color(event.color));
      yield state.copyWith(
        color: newColor,
        formzStatus: Formz.validate([
          state.task,
          state.note,
          state.startDate,
          state.endDate,
          state.groupId,
          newColor,
        ]),
      );
    } else if (event is EditTodoTodoPriorityChangeEvent) {
      yield state.copyWith(
        priority: event.priority,
      );
    } else if (event is EditTodoTodoStatusChangeEvent) {
      yield state.copyWith(
        status: event.status,
      );
    } else if (event is EditTodoGroupChangeEvent) {
      IdValue newId = IdValue.dirty(value: event.group);
      yield state.copyWith(
        groupId: newId,
        formzStatus: Formz.validate([
          state.task,
          state.note,
          state.startDate,
          state.endDate,
          newId,
          state.color,
        ]),
      );
    } else if (event is EditTodoSubmitEvent) {
      if (state.formzStatus.isValid) {
        try {
          yield state.copyWith(formzStatus: FormzStatus.submissionInProgress);
          if (event.id != null) {
            _todoBloc.add(RetrieveTodoUpdateTodoEvent(
              TodoModel(
                id: event.id,
                task: state.task.value,
                note: state.note.value,
                startDate: state.startDate.value,
                endDate: state.endDate.value,
                color: state.color.value,
                groupId: state.groupId.value,
                priority: state.priority,
                status: state.status,
              ),
            ));
          } else {
            _todoBloc.add(RetrieveTodoAddTodoEvent(
              task: state.task.value,
              note: state.note.value,
              startDate: state.startDate.value,
              endDate: state.endDate.value,
              color: state.color.value,
              groupId: state.groupId.value,
              priority: state.priority,
              status: state.status,
            ));
          }
        } catch (e) {}
      }
    } else if (event is EditTodoInitialWithTodoEvent) {
      yield EditTodoState(
        color: MyColor.dirty(value: event.todo.color),
        startDate: MyDate.dirty(value: event.todo.startDate),
        endDate: MyDate.dirty(value: event.todo.endDate),
        note: Name.dirty(value: event.todo.note),
        priority: event.todo.priority,
        status: event.todo.status,
        groupId: IdValue.dirty(value: event.todo.groupId),
      );
      add(EditTodoTaskChangeEvent(event.todo.task));
    }
  }
}
