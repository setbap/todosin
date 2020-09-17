import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_repository/repository.dart';
import 'package:uuid/uuid.dart';

part 'retrieve_color_event.dart';
// part 'retrieve_color_state.dart';

class RetrieveColorBloc extends Bloc<RetrieveColorEvent, List<ColorModel>> {
  Uuid uuid = Uuid();
  HiveColorsRepository _repository;
  RetrieveColorBloc(this._repository) : super([]) {
    add(RetrieveColorGetAllColorEvent());
  }

  @override
  Stream<List<ColorModel>> mapEventToState(
    RetrieveColorEvent event,
  ) async* {
    if (event is RetrieveColorGetAllColorEvent) {
      var all = await _repository.allColors();
      yield all;
    } else if (event is RetrieveColorAddColorEvent) {
      await _repository.addColor(ColorModel(
        id: uuid.v4(),
        color: event.color.value,
        colorName: event.colorName,
      ));
      yield await _repository.allColors();
    } else if (event is RetrieveColorUpdateColorEvent) {
      _repository.updateColor(event.model);
      yield await _repository.allColors();
    } else if (event is RetrieveColorDeleteColorEvent) {
      try {
        await event.model.delete();
      } catch (e) {
        print("err in dismiss");
      }
      yield await _repository.allColors();
    }
  }
}
