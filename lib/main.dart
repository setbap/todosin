import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todosin/bloc/retrieve_color_bloc/retrieve_color_bloc.dart';
import 'package:todosin/bloc/retrieve_group_bloc/retrieve_color_bloc.dart';
import 'package:todosin/screens/todo_edit.dart';
import 'package:todosin/sl.dart';
import 'package:todo_repository/repository.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter<ColorModel>(ColorModelAdapter());
  Hive.registerAdapter<GroupModel>(GroupModelAdapter());
  Hive.registerAdapter<TodoModel>(TodoModelAdapter());
  await DbManager.initHive();
  await DbManager.boxCreate();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RetrieveColorBloc>(
          create: (BuildContext context) => RetrieveColorBloc(locator())
            ..add(RetrieveColorGetAllColorEvent()),
        ),
        BlocProvider<RetrieveGroupBloc>(
          create: (BuildContext context) => RetrieveGroupBloc(locator()),
        ),
        // BlocProvider<RetrieveTodoBloc>(
        //   create: (BuildContext context) => RetrieveTodoBloc(locator()),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            )),
        home: EditTodoPage(),
      ),
    );
  }
}
