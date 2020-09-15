import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosin/cubit/UserFormz.dart';
import 'package:todosin/second.dart';
import 'package:todosin/sl.dart';
import 'package:todo_repository/repository.dart';
import 'cubit/usercubit_cubit.dart';

main() async {
  await DbManager.initHive();
  await DbManager.boxCreate();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsercubitCubit(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage()),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("sina"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Second(),
        )),
      ),
      body: ListView(
        children: [
          TextField(
            onChanged: context.bloc<UsercubitCubit>().passwordChange,
            decoration: InputDecoration(labelText: "password"),
          ),
          SizedBox(
            height: 32,
          ),
          UsernameField(),
          SizedBox(
            height: 32,
          ),
          BlocBuilder<UsercubitCubit, UsercubitState>(
            builder: (context, state) => Text(state.toString()),
          ),
        ],
      ),
    );
  }
}

class UsernameField extends StatelessWidget {
  const UsernameField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsercubitCubit, UsercubitState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          onChanged: (s) => context.bloc<UsercubitCubit>().usernameChange(s),
          decoration: InputDecoration(
            labelText: "username",
            errorText: state.username.error == InputError.empty
                ? "empty"
                : state.username.error == InputError.middle ? "middle" : null,
          ),
        );
      },
    );
  }
}
