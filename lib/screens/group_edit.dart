import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_repository/repository.dart';
import 'package:todosin/bloc/edit_group_bloc/edit_group_bloc.dart';
import 'package:todosin/bloc/retrieve_color_bloc/retrieve_color_bloc.dart';
import 'package:todosin/bloc/retrieve_group_bloc/retrieve_color_bloc.dart';
import 'package:todosin/model/model.dart';
import 'package:todosin/screens/color_edit.dart' as second;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: false,
        create: (context) => EditGroupBloc(context.bloc<RetrieveGroupBloc>()),
        child: MainScaffold());
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({
    Key key,
  }) : super(key: key);

  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  bool showFAB = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("group edit"),
        actions: [
          IconButton(
            icon: Icon(Icons.ad_units),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => second.SecondPage(),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: BlocBuilder<EditGroupBloc, EditGroupState>(
        builder: (context, state) {
          if (showFAB)
            return FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    showFAB = false;
                  });
                  PersistentBottomSheetController controller =
                      Scaffold.of(context).showBottomSheet(
                    (innerContext) {
                      return BottomSheetContainer(
                        state: state,
                        upperContext: context,
                      );
                    },
                  );

                  controller.closed
                      .then((value) => setState(() => showFAB = true));
                });
          return Container();
        },
      ),
      body: Column(
        children: [
          Container(
            height: 60,
          ),
          SingleChildScrollView(
            child: BlocBuilder<RetrieveGroupBloc, List<GroupModel>>(
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.length,
                  itemBuilder: (context, index) => Dismissible(
                    key: Key(state[index].id),
                    background: Container(
                      color: Color(state[index].color),
                    ),
                    onDismissed: (direction) {
                      context
                          .bloc<RetrieveGroupBloc>()
                          .add(RetrieveGroupDeleteGroupEvent(state[index]));
                    },
                    child: ListTile(
                      onLongPress: () {
                        setState(() {
                          showFAB = false;
                        });
                        context
                            .bloc<EditGroupBloc>()
                            .add(EditGroupInitialWithValueEvent(
                              color: state[index].color,
                              groupName: state[index].name,
                            ));
                        PersistentBottomSheetController controller =
                            Scaffold.of(context).showBottomSheet(
                          (innerContext) {
                            return BlocBuilder<EditGroupBloc, EditGroupState>(
                              builder: (context, editGroupState) {
                                return BottomSheetContainer(
                                  state: editGroupState,
                                  upperContext: context,
                                  id: state[index].id,
                                  update: true,
                                );
                              },
                            );
                          },
                        );

                        controller.closed
                            .then((value) => setState(() => showFAB = true));
                      },
                      tileColor: Color(state[index].color),
                      title: Text(state[index].name),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetContainer extends StatelessWidget {
  final EditGroupState state;
  final BuildContext upperContext;
  final String id;
  final bool update;

  const BottomSheetContainer({
    @required this.state,
    @required this.upperContext,
    this.id,
    this.update,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.grey.shade400,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('AlertDialog Title'),
          SingleChildScrollView(
            child: ListBody(
              children: [
                BlocBuilder<RetrieveColorBloc, List<ColorModel>>(
                  builder: (context, state) {
                    return DropdownButton<ColorModel>(
                      value: state.isEmpty ? null : state[0],
                      hint: Text("no data"),
                      onChanged: (value) => upperContext
                          .bloc<EditGroupBloc>()
                          .add(
                              EditGroupMyColorChangedEvent(Color(value.color))),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      items: state
                          .map((e) => DropdownMenuItem<ColorModel>(
                                value: e,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,
                                      color: Color(e.color),
                                    ),
                                    SizedBox(
                                      height: 16,
                                      width: 16,
                                    ),
                                    Text(e.colorName)
                                  ],
                                ),
                              ))
                          .toList(),
                    );
                  },
                ),
                SizedBox(height: 32),
                BlocBuilder<EditGroupBloc, EditGroupState>(
                  builder: (context, state) {
                    return TextFormField(
                      initialValue: state.groupName.value,
                      onChanged: (s) {
                        upperContext
                            .bloc<EditGroupBloc>()
                            .add(EditGroupGroupNameChangedEvent(s));
                      },
                      decoration: InputDecoration(
                        labelText: "username",
                        errorText: upperContext
                            .bloc<EditGroupBloc>()
                            .state
                            .groupName
                            .error
                            .errDescribe,
                      ),
                    );
                  },
                ),
                SizedBox(height: 32),
                MaterialButton(
                  onPressed: () {
                    if (update != null)
                      context
                          .bloc<EditGroupBloc>()
                          .add(EditGroupSubmitEvent(id: id));
                    else
                      context.bloc<EditGroupBloc>().add(EditGroupSubmitEvent());
                  },
                  child: Text("submit"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
