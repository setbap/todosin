import 'package:flutter/material.dart';
import 'package:todo_repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosin/bloc/edit_todo_bloc/edit_todo_bloc.dart';
import 'package:todosin/bloc/retrieve_color_bloc/retrieve_color_bloc.dart';
import 'package:todosin/bloc/retrieve_group_bloc/retrieve_color_bloc.dart';
import 'package:todosin/util/extensions.dart';
import 'package:todosin/model/model.dart';

class EditTodoBottomShett extends StatelessWidget {
  const EditTodoBottomShett();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: TodoEditBody(),
    );
  }
}

class TodoEditBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTodoBloc, EditTodoState>(
      builder: (context, state) => ListView(
        children: [
          TextFormField(
            initialValue: state.task.value,
            onChanged: (value) => context.bloc<EditTodoBloc>().add(
                  EditTodoTaskChangeEvent(value),
                ),
            decoration: InputDecoration(
              labelText: "task",
              errorText: state.task.error.errDescribe,
            ),
          ).p(8),
          TextFormField(
            initialValue: state.note.value,
            decoration: InputDecoration(
              labelText: "note",
              errorText: state.note.error.errDescribe,
            ),
            onChanged: (value) => context.bloc<EditTodoBloc>().add(
                  EditTodoNoteChangeEvent(value),
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
                            onChanged: (value) {
                              context
                                  .bloc<EditTodoBloc>()
                                  .add(EditTodoColorChangeEvent(value.color));
                            },
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
                        builder: (context, groupBlocstate) {
                          return DropdownButton<GroupModel>(
                            value: state.groupId.value == null
                                ? null
                                : groupBlocstate.firstWhere((element) =>
                                    element.id == state.groupId.value),
                            hint: Text("pls insert color").px(8),
                            isExpanded: true,
                            items: groupBlocstate
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name).p(8),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              context
                                  .bloc<EditTodoBloc>()
                                  .add(EditTodoGroupChangeEvent(value.id));
                            },
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
                        value: state.priority,
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
                        onChanged: (value) {
                          context
                              .bloc<EditTodoBloc>()
                              .add(EditTodoTodoPriorityChangeEvent(value));
                        },
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
                        value: state.status,
                        hint: Text("pls select status").px(8),
                        isExpanded: true,
                        items: TodoStatus.values
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.toString().split(".")[1]).p(8),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          context
                              .bloc<EditTodoBloc>()
                              .add(EditTodoTodoStatusChangeEvent(value));
                        },
                        underline: Container(
                          height: 3,
                        ),
                      ),
                    ).p(8),
                  ],
                ),
              ),
            ],
          ),
          MaterialButton(
            onPressed: () =>
                context.bloc<EditTodoBloc>().add(EditTodoSubmitEvent()),
            child: Text("data"),
          )
        ],
      ),
    );
  }
}
