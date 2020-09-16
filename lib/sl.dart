import 'package:get_it/get_it.dart';
import 'package:todo_repository/repository.dart';

var locator = GetIt.I;

void setupLocator() {
  locator.registerSingleton(DbManager());
  locator.registerFactory(() => HiveColorsRepository(locator()));
  locator.registerFactory(() => HiveTodosRepository(locator()));
  locator.registerFactory(() => HiveGroupsRepository(locator()));
  print("serice locator");
}
