import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_repository/repository.dart';
import 'package:uuid/uuid.dart';

part 'retrieve_color_event.dart';
// part 'retrieve_color_state.dart';

class RetrieveGroupBloc extends Bloc<RetrieveGroupEvent, List<GroupModel>> {
  Uuid uuid = Uuid();
  HiveGroupsRepository _repository;
  RetrieveGroupBloc(this._repository) : super([]) {
    add(RetrieveGroupGetAllGroupEvent());
  }

  @override
  Stream<List<GroupModel>> mapEventToState(
    RetrieveGroupEvent event,
  ) async* {
    if (event is RetrieveGroupGetAllGroupEvent) {
      var all = await _repository.allGroups();
      yield all;
    } else if (event is RetrieveGroupAddGroupEvent) {
      await _repository.addGroup(GroupModel(
        id: uuid.v4(),
        color: event.color.value,
        name: event.name,
      ));
      yield await _repository.allGroups();
    } else if (event is RetrieveGroupUpdateColorEvent) {
      _repository.updateGroup(event.model);
      yield await _repository.allGroups();
    } else if (event is RetrieveGroupDeleteGroupEvent) {
      try {
        await event.model.delete();
      } catch (e) {
        print("err in dismiss");
      }
      yield await _repository.allGroups();
    }
  }
}
