part of 'edit_group_bloc.dart';

class EditGroupState extends Equatable {
  final MyColor myColor;
  final Name groupName;
  final FormzStatus status;

  const EditGroupState({
    @required this.myColor,
    @required this.groupName,
    @required this.status,
  });

  @override
  List<Object> get props => [myColor, groupName];

  EditGroupState copyWith({
    FormzStatus status,
    MyColor myColor,
    Name groupName,
  }) {
    return EditGroupState(
      status: status ?? this.status,
      myColor: myColor ?? this.myColor,
      groupName: groupName ?? this.groupName,
    );
  }

  @override
  String toString() => "mc:${myColor.value} ,c: ${groupName.value} ";
}
