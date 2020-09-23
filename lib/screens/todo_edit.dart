import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_repository/repository.dart';
import 'package:todosin/bloc/edit_todo_bloc/edit_todo_bloc.dart';
import 'package:todosin/bloc/retrieve_todo_bloc/retrieve_todo_bloc.dart';

import 'package:todosin/widgets/edit_todo/todo_edit_bottom_sheet.dart';
import 'group_edit.dart';

List<String> fakeList = ["one", "two", "three"];

class EditTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TodEditScaffold(),
    );
  }
}

class TodEditScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scafflodkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EditTodoBloc(retrieveTodoBloc: context.bloc<RetrieveTodoBloc>()),
      child: Scaffold(
        key: _scafflodkey,
        appBar: AppBar(
          title: Text("todo edit"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _scafflodkey.currentState.showBottomSheet(
            (context) => EditTodoBottomShett(),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Expanded(child: BlocBuilder<RetrieveTodoBloc, List<TodoModel>>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(state[index].task),
                    leading: CircleAvatar(
                      backgroundColor: Color(state[index].color),
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
