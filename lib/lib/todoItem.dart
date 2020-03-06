import 'package:flutter/material.dart';
import 'package:todo_app/task.dart';
import 'package:todo_app/task_op.dart'; // for RemoveTask(task) in _buildDeleteButton
import 'package:flutter_redux/flutter_redux.dart';

class TodoItem extends StatelessWidget {
  final Task task;
  // const StatelessWidget({ Key key }) : super(key: key);
  const TodoItem({Key key, this.task}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    // TO DO: Use ChangeTaskStatus and Checkbox in Checkbox.dart
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              SizedBox( // size of check boxes
                width: 25.0,
                height: 25.0,
                ),
              SizedBox( // distance btw check boxes and task str
                width: 11.0,
              ),
              Text(
                task.name,
                style: TextStyle(
                  color: task.done ? Colors.black38 : Colors.black87, // appearance of task str
                  fontSize: 19.0,
                  decoration: task.done
                      ? TextDecoration.lineThrough  // if task done
                      : TextDecoration.none,        // if not
                ),
              ),
            ],
          ),
        ),
        SizedBox(  // in basic.dart
          width: 20.0,
          height: 20.0,
          child: _buildDeleteButton(),
        ),
      ],
    );
  }

  _buildDeleteButton() {
    // TO DO: See Tutorials. Use IconButton in Icon_button.dart, Icons.delete in icons.dart, 
    // VoidCallback in window.dart (for onPressed:  task.done ? action : null)
    if (!task.done) {
      return SizedBox(); 
    }
  }
}
