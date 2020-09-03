import './models/models.dart';

abstract class ColorsRepository {
  Future<void> addColor(ColorModel model);

  Future<void> removeColor(ColorModel model);

  Future<void> updateColor(ColorModel model);

  Future<List<ColorModel>> allColors();
}
