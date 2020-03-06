import 'package:flutter/material.dart';
import 'package:todo_app/task_list.dart';
import 'package:todo_app/task.dart';
import 'task_op.dart';

class TodoList extends StatefulWidget{
  @override
  createState()=> new TodoListState();
}
class TodoListState extends State<TodoList> {
//  @override
//  Widget build(BuildContext context){
//    return new Scaffold(appBar: new AppBar(title: new Text('Check Yourself')));
//  }
  List<String>_todoItems = [];

  void _addTodo(String task) {
    if (task.length > 0) {
      setState(() => _todoItems.add(task));
    }
  }


  Widget _buildToDoItem(String input, int index) {
        return new CheckboxListTile(
              secondary: Icon(Icons.close),
              // onChanged: widget.onclese,
          value: false,
          controlAffinity: ListTileControlAffinity.leading,
          title: new Text(input)
    );
  }

  Widget _buildToDoList() {
    return new ListView.builder(
        itemBuilder: (context, index) {
          if (index < _todoItems.length) {
            return _buildToDoItem(_todoItems[index], index);
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Check Yourself'),
    ),
      body: _buildToDoList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _pushAddToDo,
          tooltip: 'Add task',
          child: new Icon(Icons.add)
      ),
    );
  }

  void _pushAddToDo() {
    print (_todoItems.toString());
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                  appBar: new AppBar(title: new Text('add a task')
                  ),
                  body: new TextField(
                    autofocus: true,
                    onSubmitted: (val) {
                      _addTodo(val);
                      Navigator.pop(context);
                    },
                    decoration: new InputDecoration(
                        hintText: "What do you want to accomplish?",
                        contentPadding: const EdgeInsets.all(15.0)
                    ),
                  )
              );
            })
    );
  }

  void _removeTodo(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveToDo(int index) {
    showDialog(context: context, builder: (BuildContext context) {
      return new AlertDialog(
          title: new Text('Delete "${_todoItems[index]}" ?'),
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.of(context).pop(),
                child: new Text ('Cancel')),
            new FlatButton(
                child: new Text('DELETE'),
                onPressed: () {
                  _removeTodo(index);
                  Navigator.of(context).pop();
                }
            )
          ]
      );
    }
    );
  }
}