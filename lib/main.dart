import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todosin/person.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    var dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
  } else {
    await Hive.initFlutter();
  }
  Hive.registerAdapter(PersonAdapter());
  await Hive.openBox<Person>("persons");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var personsBox = Hive.box<Person>("persons");

    return Scaffold(
      appBar: AppBar(
        title: Text("sina"),
      ),
      body: ListView.builder(
        itemCount: personsBox.values.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(personsBox.getAt(index).name),
          leading: Text(personsBox.getAt(index).age.toString()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("add"),
          onPressed: () {
            personsBox.add(Person(age: Random().nextInt(100), name: "sina"));
            setState(() {});
          }),
    );
  }
}
