part of 'edit_color_bloc.dart';

class EditColorState extends Equatable {
  final MyColor myColor;
  final ColorName colorName;
  final FormzStatus status;

  const EditColorState({
    @required this.myColor,
    @required this.colorName,
    @required this.status,
  });

  @override
  List<Object> get props => [myColor, colorName];

  EditColorState copyWith({
    FormzStatus status,
    MyColor myColor,
    ColorName colorName,
  }) {
    return EditColorState(
      status: status ?? this.status,
      myColor: myColor ?? this.myColor,
      colorName: colorName ?? this.colorName,
    );
  }

  @override
  String toString() => "mc:${myColor.value} ,c: ${colorName.value} ";
}
