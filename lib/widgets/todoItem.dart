import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/todo_model.dart';


class TodoItem extends StatelessWidget {
  final Task task;
  
  TodoItem({@required this.task});

  @override
  Widget build(BuildContext context) {
    Color checkedColor = const Color.fromARGB(0xFF, 0x81, 0xA5, 0xF1);  // the color appears when this checkbox is checked
    Color iconColor = const Color.fromARGB(0xFE, 0xFE, 0xFE, 0xFE); 
    return new CheckboxListTile(
          value: task.done,
          onChanged: (bool value) {
            Provider.of<TodoModel>(context, listen: false).toggleDone(task);
          },
          activeColor: checkedColor, // the color appears when this checkbox is checked, Colors.black12 looks better?
          checkColor: iconColor,
          secondary: IconButton(
            onPressed: () => _promptRemoveToDo(context),
            icon: Icon(Icons.close),
            color: Colors.red,
          ),
          
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(task.name, style: TextStyle(
                      color: task.done ? Colors.black38 : Colors.black87,
                      fontSize: 18.7,
                      decoration: task.done
                      ? TextDecoration.lineThrough
                      : TextDecoration.none)
          )
    );
  }

  void _promptRemoveToDo(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context) {
      return new AlertDialog(
          title: new Text('Delete "${task.name}" ?'),
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.of(context).pop(),
                child: new Text ('Cancel')),
            new FlatButton(
                child: new Text('DELETE'),
                onPressed: () {
                  Provider.of<TodoModel>(context, listen: false).removeTodo(task);
                  Navigator.of(context).pop();
                }
            )
          ]
      );
    }
    );
  }

}
