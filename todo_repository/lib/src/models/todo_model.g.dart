// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoStatusAdapter extends TypeAdapter<TodoStatus> {
  @override
  final int typeId = 4;

  @override
  TodoStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return TodoStatus.TODO;
      case 2:
        return TodoStatus.DOING;
      case 3:
        return TodoStatus.DONE;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, TodoStatus obj) {
    switch (obj) {
      case TodoStatus.TODO:
        writer.writeByte(1);
        break;
      case TodoStatus.DOING:
        writer.writeByte(2);
        break;
      case TodoStatus.DONE:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TodoPriorityAdapter extends TypeAdapter<TodoPriority> {
  @override
  final int typeId = 4;

  @override
  TodoPriority read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return TodoPriority.LOW;
      case 2:
        return TodoPriority.MEDIUM;
      case 3:
        return TodoPriority.HIGH;
      case 4:
        return TodoPriority.CRITICAL;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, TodoPriority obj) {
    switch (obj) {
      case TodoPriority.LOW:
        writer.writeByte(1);
        break;
      case TodoPriority.MEDIUM:
        writer.writeByte(2);
        break;
      case TodoPriority.HIGH:
        writer.writeByte(3);
        break;
      case TodoPriority.CRITICAL:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoPriorityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TodoModelAdapter extends TypeAdapter<TodoModel> {
  @override
  final int typeId = 3;

  @override
  TodoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoModel(
      id: fields[1] as String,
      task: fields[2] as String,
      startDate: fields[4] as DateTime,
      endDate: fields[5] as DateTime,
      color: fields[6] as Color,
      groupId: fields[9] as String,
      priority: fields[7] as TodoPriority,
      status: fields[8] as TodoStatus,
    );
  }

  @override
  void write(BinaryWriter writer, TodoModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.task)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.priority)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.groupId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
