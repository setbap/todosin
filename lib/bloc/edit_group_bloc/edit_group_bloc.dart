import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:todo_repository/repository.dart';
import 'package:todosin/bloc/retrieve_group_bloc/retrieve_color_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../model/model.dart';

part 'edit_group_event.dart';
part 'edit_group_state.dart';

class EditGroupBloc extends Bloc<EditGroupEvent, EditGroupState> {
  var uuid = Uuid();
  final RetrieveGroupBloc _retrieveGroupBlocBloc;
  EditGroupBloc(this._retrieveGroupBlocBloc)
      : super(EditGroupState(
          myColor: MyColor.pure(),
          groupName: Name.pure(),
          status: FormzStatus.pure,
        ));

  @override
  Stream<EditGroupState> mapEventToState(
    EditGroupEvent event,
  ) async* {
    if (event is EditGroupInitialWithValueEvent) {
      final myColor = MyColor.dirty(value: Color(event.color));
      final groupName = Name.dirty(value: event.groupName);
      yield state.copyWith(
        myColor: myColor,
        groupName: groupName,
        status: Formz.validate([groupName, myColor]),
      );
    }
    if (event is EditGroupMyColorChangedEvent) {
      final myColor = MyColor.dirty(value: event.value);
      yield state.copyWith(
        myColor: myColor,
        status: Formz.validate([state.groupName, myColor]),
      );
    } else if (event is EditGroupGroupNameChangedEvent) {
      final groupName = Name.dirty(value: event.value);
      print(event.value);
      yield state.copyWith(
        groupName: groupName,
        status: Formz.validate([state.myColor, groupName]),
      );
    }
    if (event is EditGroupSubmitEvent) {
      if (state.status.isValid) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        try {
          if (event.id != null) {
            _retrieveGroupBlocBloc.add(
              RetrieveGroupUpdateColorEvent(GroupModel(
                id: event.id,
                color: state.myColor.value.value,
                name: state.groupName.value,
              )),
            );
          } else {
            _retrieveGroupBlocBloc.add(
              RetrieveGroupAddGroupEvent(
                state.myColor.value,
                state.groupName.value,
              ),
            );
          }
          yield state.copyWith(
            // myColor: MyColor.pure(),
            // groupName: groupName.pure(),
            status: FormzStatus.submissionSuccess,
          );
        } catch (e) {
          yield state.copyWith(
            status: FormzStatus.submissionFailure,
          );
        }
      }
    }
  }
}
