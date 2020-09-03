import 'package:todos_repository/src/models/models.dart';

abstract class TodosRepository {
  Future<void> addTodo(TodoModel model);

  Future<void> removeTodo(TodoModel model);

  Future<void> updateTodo(TodoModel model);

  Future<List<TodoModel>> allTodos();
}
