import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './models/models.dart';
import 'package:path_provider/path_provider.dart';

const TODO_BOX_NAME = "todo_box";
const GROUP_BOX_NAME = "group_box";
const COLOR_BOX_NAME = "colors_box";

class DbManager {
  final Box<ColorModel> colorBox;
  final Box<GroupModel> groupBox;
  final Box<TodoModel> todoBox;

  DbManager()
      : todoBox = Hive.box<TodoModel>(TODO_BOX_NAME),
        groupBox = Hive.box<GroupModel>(GROUP_BOX_NAME),
        colorBox = Hive.box<ColorModel>(COLOR_BOX_NAME);

  static initHive() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (!kIsWeb) {
      var dir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(dir.path);
    } else {
      await Hive.initFlutter();
    }
    Hive.registerAdapter(ColorModelAdapter());
    Hive.registerAdapter(GroupModelAdapter());
    Hive.registerAdapter(TodoModelAdapter());
  }

  static boxCreate() async {
    await Hive.openBox<ColorModel>(COLOR_BOX_NAME);
    await Hive.openBox<GroupModel>(GROUP_BOX_NAME);
    await Hive.openBox<TodoModel>(TODO_BOX_NAME);
  }
}
