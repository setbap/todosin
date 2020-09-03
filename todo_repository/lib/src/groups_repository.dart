import './models/models.dart';

abstract class GroupsRepository {
  Future<void> addGroup(GroupModel model);

  Future<void> removeGroup(GroupModel model);

  Future<void> updateGroup(GroupModel model);

  Future<List<GroupModel>> allGroups();

  Future<List<TodoModel>> todosOfGroup(GroupModel model);
}
