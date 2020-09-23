import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 5)
enum TodoStatus {
  @HiveField(1)
  TODO,
  @HiveField(2)
  DOING,
  @HiveField(3)
  DONE,
}

@HiveType(typeId: 4)
enum TodoPriority {
  @HiveField(1)
  LOW,
  @HiveField(2)
  MEDIUM,
  @HiveField(3)
  HIGH,
  @HiveField(4)
  CRITICAL,
}

@HiveType(typeId: 3)
class TodoModel extends HiveObject with EquatableMixin {
  @HiveField(1)
  final String id;

  @HiveField(2)
  final String task;

  @HiveField(3)
  final String note;

  @HiveField(4)
  final DateTime startDate;

  @HiveField(5)
  final DateTime endDate;

  @HiveField(6)
  final int color;

  @HiveField(7)
  final TodoPriority priority;

  @HiveField(8)
  final TodoStatus status;

  @HiveField(9)
  final String groupId;

  TodoModel({
    @required this.id,
    @required this.task,
    String note = '',
    @required this.startDate,
    @required this.endDate,
    @required this.color,
    @required this.groupId,
    @required this.priority,
    this.status = TodoStatus.TODO,
  }) : this.note = note ?? "";

  TodoModel copyWith({
    String id,
    String task,
    String note,
    DateTime startDate,
    DateTime endDate,
    Color color,
    String groupId,
    TodoPriority priority,
    TodoStatus status,
  }) {
    return TodoModel(
      id: id ?? this.id,
      task: task ?? this.task,
      note: note ?? this.note,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      color: color ?? this.color,
      groupId: groupId ?? this.groupId,
      priority: priority ?? this.priority,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [id];
}
