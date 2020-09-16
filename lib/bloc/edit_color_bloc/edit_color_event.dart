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
  const EditColorSubmitEvent();
}
