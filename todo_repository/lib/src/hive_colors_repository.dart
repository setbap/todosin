import './colors_repository.dart';
import './models/color_model.dart';

import 'Db_manager.dart';

class HiveColorsRepository extends ColorsRepository {
  final DbManager _manager;

  HiveColorsRepository(this._manager);

  @override
  Future<void> addColor(ColorModel model) async {
    await _manager.colorBox.put(model.id, model);
    return;
  }

  @override
  Future<List<ColorModel>> allColors() async {
    return _manager.colorBox.values.toList();
  }

  @override
  Future<void> removeColor(ColorModel model) async {
    return _manager.colorBox.delete(model.id);
  }

  @override
  Future<void> updateColor(ColorModel model) async {
    await _manager.colorBox.put(model.id, model);
    return;
  }
}
