import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'group_model.g.dart';

@HiveType(typeId: 2)
class GroupModel extends Equatable {
  @HiveField(1)
  final String id;

  @HiveField(2)
  final Color color;

  @HiveField(3)
  final String name;

  // List<TodoModel> todos;

  const GroupModel(
      {@required this.id, @required this.color, @required this.name});

  GroupModel copyWith({String id, Color color, String name}) => GroupModel(
        id: id ?? this.id,
        color: color ?? this.color,
        name: name ?? this.name,
      );

  @override
  List<Object> get props => [id];
}
