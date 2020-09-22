import 'package:flutter/material.dart';

extension WidgetPadding on Widget {
  /// Wrapp [widget] with [Padding] and aplly [input] to x axis
  Widget px(double paddingX) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingX),
      child: this,
    );
  }

  /// Wrapp [widget] with [Padding] and aplly [input] to y axis
  Widget py(double paddingY) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingY),
      child: this,
    );
  }

  /// Wrapp [widget] with [Padding] and aplly [input] to all side
  Widget p(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }
}

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
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: fakeList[0],
                  isExpanded: true,
                  items: fakeList
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e).p(8),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => print(value),
                  underline: Container(
                    height: 3,
                  ),
                ),
              ).p(8),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: fakeList[0],
                  isExpanded: true,
                  items: fakeList
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e).p(8),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => print(value),
                  underline: Container(
                    height: 3,
                  ),
                ),
              ).p(8),
            ),
          ],
        )
      ],
    );
  }
}
