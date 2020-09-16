// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ColorModelAdapter extends TypeAdapter<ColorModel> {
  @override
  final int typeId = 1;

  @override
  ColorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColorModel(
      id: fields[1] as String,
      color: fields[2] as int,
      colorName: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ColorModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.colorName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
