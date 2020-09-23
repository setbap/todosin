import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_repository/repository.dart';
import 'package:uuid/uuid.dart';

part 'retrieve_todo_event.dart';

class RetrieveTodoBloc extends Bloc<RetrieveTodoEvent, List<TodoModel>> {
  Uuid uuid = Uuid();
  HiveTodosRepository _repository;
  RetrieveTodoBloc(this._repository) : super([]) {
    add(RetrieveTodoGetAllTodoEvent());
  }

  @override
  Stream<List<TodoModel>> mapEventToState(
    RetrieveTodoEvent event,
  ) async* {
    if (event is RetrieveTodoGetAllTodoEvent) {
      var all = await _repository.allTodos();
      yield all;
    } else if (event is RetrieveTodoAddTodoEvent) {
      print("aded");
      await _repository.addTodo(TodoModel(
        id: uuid.v4(),
        color: event.color.value,
        endDate: event.endDate,
        startDate: event.startDate,
        groupId: event.groupId,
        task: event.task,
        note: event.note,
        priority: event.priority,
        status: event.status,
      ));
      yield await _repository.allTodos();
    } else if (event is RetrieveTodoUpdateTodoEvent) {
      _repository.updateTodo(event.model);
      yield await _repository.allTodos();
    } else if (event is RetrieveTodoDeleteTodoEvent) {
      try {
        await event.model.delete();
      } catch (e) {
        print("err in dismiss");
      }
      yield await _repository.allTodos();
    }
  }
}
