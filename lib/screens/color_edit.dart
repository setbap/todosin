import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' hide ColorModel;
import 'package:todo_repository/repository.dart';
import 'package:todosin/bloc/edit_color_bloc/edit_color_bloc.dart';
import 'package:todosin/bloc/retrieve_color_bloc/retrieve_color_bloc.dart';
import 'package:todosin/model/ColorFormModel.dart';

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
        title: Text("Sina"),
      ),
      floatingActionButton: BlocBuilder<EditColorBloc, EditColorState>(
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
      body: SingleChildScrollView(
        child: BlocBuilder<RetrieveColorBloc, List<ColorModel>>(
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key(state[index].id),
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (direction) {
                  context
                      .bloc<RetrieveColorBloc>()
                      .add(RetrieveColorDeleteColorEvent(state[index]));
                },
                child: ListTile(
                  onLongPress: () {
                    setState(() {
                      showFAB = false;
                    });
                    context
                        .bloc<EditColorBloc>()
                        .add(EditColorInitialWithValueEvent(
                          color: state[index].color,
                          colorName: state[index].colorName,
                        ));
                    PersistentBottomSheetController controller =
                        Scaffold.of(context).showBottomSheet(
                      (innerContext) {
                        return BlocBuilder<EditColorBloc, EditColorState>(
                          builder: (context, editColorState) {
                            return BottomSheetContainer(
                              state: editColorState,
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
                  title: Text(state[index].colorName),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BottomSheetContainer extends StatelessWidget {
  final EditColorState state;
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
                MaterialButton(
                    color: state.myColor.value,
                    child: Text("data"),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            titlePadding: const EdgeInsets.all(0.0),
                            contentPadding: const EdgeInsets.all(0.0),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: state.myColor.value,
                                onColorChanged: (c) =>
                                    upperContext.bloc<EditColorBloc>().add(
                                          EditColorMyColorChangedEvent(c),
                                        ),
                                colorPickerWidth: 300.0,
                                pickerAreaHeightPercent: 0.7,
                                enableAlpha: true,
                                displayThumbColor: true,
                                showLabel: true,
                                paletteType: PaletteType.hsv,
                                pickerAreaBorderRadius: const BorderRadius.only(
                                  topLeft: const Radius.circular(2.0),
                                  topRight: const Radius.circular(2.0),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                SizedBox(height: 32),
                BlocBuilder<EditColorBloc, EditColorState>(
                  builder: (context, state) {
                    return TextFormField(
                      initialValue: state.colorName.value,
                      onChanged: (s) {
                        upperContext
                            .bloc<EditColorBloc>()
                            .add(EditColorColorNameChangedEvent(s));
                      },
                      decoration: InputDecoration(
                        labelText: "username",
                        errorText: context
                            .bloc<EditColorBloc>()
                            .state
                            .colorName
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
                          .bloc<EditColorBloc>()
                          .add(EditColorSubmitEvent(id: id));
                    else
                      context.bloc<EditColorBloc>().add(EditColorSubmitEvent());
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
