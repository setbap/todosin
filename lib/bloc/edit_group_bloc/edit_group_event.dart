part of 'edit_group_bloc.dart';

abstract class EditGroupEvent extends Equatable {
  const EditGroupEvent();

  @override
  List<Object> get props => [];
}

class EditGroupMyColorChangedEvent extends EditGroupEvent {
  final Color value;
  const EditGroupMyColorChangedEvent(this.value);

  @override
  List<Object> get props => [value];
}

class EditGroupGroupNameChangedEvent extends EditGroupEvent {
  final String value;
  const EditGroupGroupNameChangedEvent(this.value);

  @override
  List<Object> get props => [value];
}

class EditGroupSubmitEvent extends EditGroupEvent {
  final String id;
  const EditGroupSubmitEvent({this.id});
}

class EditGroupInitialWithValueEvent extends EditGroupEvent {
  final String groupName;
  final int color;
  const EditGroupInitialWithValueEvent({this.color, this.groupName});

  @override
  List<Object> get props => [color, groupName];
}
