import 'package:flutter/material.dart';
import 'package:todo_repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosin/bloc/retrieve_color_bloc/retrieve_color_bloc.dart';
import 'package:todosin/bloc/retrieve_group_bloc/retrieve_color_bloc.dart';
import 'package:todosin/util/extensions.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todo edit"),
        actions: [
          FlatButton.icon(
            label: Text("data"),
            icon: Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            ),
          )
        ],
      ),
      body: TodoEditBody(),
    );
  }
}

class TodoEditBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: "task",
          ),
        ).p(8),
        TextFormField(
          decoration: InputDecoration(
            labelText: "task",
          ),
          maxLines: 4,
        ).p(8),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Color").px(16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: BlocBuilder<RetrieveColorBloc, List<ColorModel>>(
                      builder: (context, state) {
                        return DropdownButton<ColorModel>(
                          value: state.isEmpty ? null : state[0],
                          hint: Text("pls insert color").px(8),
                          isExpanded: true,
                          items: state
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.colorName).p(8),
                                ),
                              )
                              .toList(),
                          onChanged: (value) => print(value),
                          underline: Container(
                            height: 3,
                          ),
                        );
                      },
                    ),
                  ).p(8),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Group").px(16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: BlocBuilder<RetrieveGroupBloc, List<GroupModel>>(
                      builder: (context, state) {
                        return DropdownButton<GroupModel>(
                          value: state.isEmpty ? null : state[0],
                          hint: Text("pls insert color").px(8),
                          isExpanded: true,
                          items: state
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.name).p(8),
                                ),
                              )
                              .toList(),
                          onChanged: (value) => print(value),
                          underline: Container(
                            height: 3,
                          ),
                        );
                      },
                    ),
                  ).p(8),
                ],
              ),
            ),
          ],
        ).py(16),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Priroty").px(16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<TodoPriority>(
                      value: TodoPriority.MEDIUM,
                      hint: Text("pls select priority").px(8),
                      isExpanded: true,
                      items: TodoPriority.values
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.toString().split(".")[1]).p(8),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => print(value),
                      underline: Container(
                        height: 3,
                      ),
                    ),
                  ).p(8),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Todo Status").px(16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<TodoStatus>(
                      value: TodoStatus.TODO,
                      hint: Text("pls insert color").px(8),
                      isExpanded: true,
                      items: TodoStatus.values
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.toString().split(".")[1]).p(8),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => print(value),
                      underline: Container(
                        height: 3,
                      ),
                    ),
                  ).p(8),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
