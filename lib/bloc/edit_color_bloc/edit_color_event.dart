part of 'edit_color_bloc.dart';

abstract class EditColorEvent extends Equatable {
  const EditColorEvent();

  @override
  List<Object> get props => [];
}

class EditColorMyColorChangedEvent extends EditColorEvent {
  final Color value;
  const EditColorMyColorChangedEvent(this.value);

  @override
  List<Object> get props => [value];
}

class EditColorColorNameChangedEvent extends EditColorEvent {
  final String value;
  const EditColorColorNameChangedEvent(this.value);

  @override
  List<Object> get props => [value];
}

class EditColorSubmitEvent extends EditColorEvent {
  final String id;
  const EditColorSubmitEvent({this.id});
}

class EditColorInitialWithValueEvent extends EditColorEvent {
  final String colorName;
  final int color;
  const EditColorInitialWithValueEvent({this.color, this.colorName});

  @override
  List<Object> get props => [color, colorName];
}
