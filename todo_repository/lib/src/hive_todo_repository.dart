import 'package:todos_repository/src/models/models.dart';
import 'package:todos_repository/src/Db_manager.dart';
import 'package:todos_repository/src/todos_repository.dart';

class HiveTodosRepository extends TodosRepository {
  final DbManager _manager;

  HiveTodosRepository(this._manager);

  @override
  Future<void> addTodo(TodoModel model) async {
    await _manager.todoBox.put(model.id, model);
    return;
  }

  @override
  Future<List<TodoModel>> allTodos() async {
    return _manager.todoBox.values.toList();
  }

  @override
  Future<void> removeTodo(TodoModel model) async {
    return _manager.todoBox.delete(model.id);
  }

  @override
  Future<void> updateTodo(TodoModel model) async {
    await _manager.todoBox.put(model.id, model);
    return;
  }
}
