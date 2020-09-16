import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'color_model.g.dart';

@HiveType(typeId: 1)
class ColorModel extends HiveObject with EquatableMixin {
  @HiveField(1)
  final String id;

  @HiveField(2)
  final int color;

  @HiveField(3)
  final String colorName;

  ColorModel({
    @required this.id,
    @required this.color,
    @required this.colorName,
  });

  ColorModel copyWith({String id, int color, String name}) => ColorModel(
        id: id ?? this.id,
        color: color ?? this.color,
        colorName: colorName ?? this.colorName,
      );

  @override
  List<Object> get props => [id];
}
