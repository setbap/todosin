import './groups_repository.dart';
import './models/models.dart';
import './Db_manager.dart';

class HiveGroupsRepository extends GroupsRepository {
  final DbManager _manager;

  HiveGroupsRepository(this._manager);

  @override
  Future<void> addGroup(GroupModel model) async {
    await _manager.groupBox.put(model.id, model);
    return;
  }

  @override
  Future<List<GroupModel>> allGroups() async {
    return _manager.groupBox.values.toList();
  }

  @override
  Future<void> removeGroup(GroupModel model) async {
    // _manager.groupBox.values.every((element) => {});
    for (var item in _manager.todoBox.values) {
      if (item.groupId == model.id) {
        await item.delete();
      }
    }
    await _manager.groupBox.delete(model.id);
    return;
  }

  @override
  Future<void> updateGroup(GroupModel model) async {
    await _manager.groupBox.put(model.id, model);
    return;
  }

  @override
  Future<List<TodoModel>> todosOfGroup(GroupModel model) async {
    await Future.value();
    return _manager.todoBox.values
        .where((element) => element.groupId == model.id)
        .toList();
  }
}
