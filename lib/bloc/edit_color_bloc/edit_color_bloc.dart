import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:uuid/uuid.dart';

import 'package:todosin/bloc/retrieve_color_bloc/retrieve_color_bloc.dart';

import '../../model/ColorFormModel.dart';

part 'edit_color_event.dart';
part 'edit_color_state.dart';

class EditColorBloc extends Bloc<EditColorEvent, EditColorState> {
  var uuid = Uuid();
  final RetrieveColorBloc _retrieveColorBloc;
  EditColorBloc(this._retrieveColorBloc)
      : super(EditColorState(
          myColor: MyColor.pure(),
          colorName: ColorName.pure(),
          status: FormzStatus.pure,
        ));

  @override
  Stream<EditColorState> mapEventToState(
    EditColorEvent event,
  ) async* {
    if (event is EditColorMyColorChangedEvent) {
      final myColor = MyColor.dirty(value: event.value);
      yield state.copyWith(
        myColor: myColor,
        status: Formz.validate([state.colorName, myColor]),
      );
    } else if (event is EditColorColorNameChangedEvent) {
      final colorName = ColorName.dirty(value: event.value);
      print(event.value);
      yield state.copyWith(
        colorName: colorName,
        status: Formz.validate([state.myColor, colorName]),
      );
    }
    if (event is EditColorSubmitEvent) {
      if (state.status.isValid) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        try {
          _retrieveColorBloc.add(
            RetrieveColorAddColorEvent(
              state.myColor.value,
              state.colorName.value,
            ),
          );

          yield state.copyWith(
            // myColor: MyColor.pure(),
            // colorName: ColorName.pure(),
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
