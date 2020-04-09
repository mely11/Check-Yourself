import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/todo_model.dart';


class TodoItem extends StatelessWidget {
  // This class creates a todoItem, including its properties
  final Task task;
  
  TodoItem({@required this.task}); // the constuctor for a todoItem that requires a task

  @override
  Widget build(BuildContext context) {
    // builds the todoItem
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
    // Creates a prompt with an alert message in a new page, which results in either 
    // the cancellation of the removal or the removal of the intended/pressed task 
    // from the todoItems list using removeTodo method in TodoModel class with 
    // the aid of Provider as a mocked class while popping the alert/prompt page
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
