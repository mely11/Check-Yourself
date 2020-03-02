import 'package:flutter/material.dart';
import 'package:flutter_todo/model.dart';

class CreateScreen extends StatefulWidget {
  final Category category;
  final ValueChanged taskChanged;
  final VoidCallback onClose;

  const CreateScreen({Key key, this.category, this.taskChanged, this.onClose}) : super(key: key);

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
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(11.0),
          child: Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.close, color: Colors.black87),
                onPressed: widget.onClose,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Text(
                    "➕",
                    style: TextStyle(color: Colors.black87, fontSize: 39.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(81.0),
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: widget.taskChanged,
                  controller: _taskController,
                  style: Theme.of(context).textTheme.title,
                  decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.subhead),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
