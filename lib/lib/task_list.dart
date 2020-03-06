import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/task.dart';

class CreateScreen extends StatefulWidget {
  final VoidCallback onClose;
  final ValueChanged taskChanged;
  const CreateScreen({Key key, this.taskChanged, this.onClose}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController _taskController;

  @override
  void initState() {
    _taskController = TextEditingController();
    super.initState();
  }

@override
 Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(7.0),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 70.0, right: 79.0, top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  "Check Yourself",
                  style: Theme.of(context).textTheme.subhead,
                ),
                SizedBox(
                  height: 11.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}