import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/calendar.dart';
import 'package:todo_app/screens/options_screen.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/globals.dart' as globals;


class TodoListScreen extends StatefulWidget{
  @override
  createState()=> new TodoListScreenState();
}
class TodoListScreenState extends State<TodoListScreen> {

  Widget _buildToDoList(BuildContext context){
    return Consumer<TodoModel>(
      builder: (context, todos, child) => TodoList(todoItems: todos.todoItems)
    );
  }


  @override
  Widget build(BuildContext context){
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Check Yourself '+globals.setDate),
        actions: <Widget>[
          IconButton(
            onPressed: _gotoCalendar,
            tooltip: 'Open Calendar',
            icon: Icon(Icons.calendar_today,),
          ),
          IconButton(
              onPressed: _pushAddToDo,
              tooltip: 'Add task',
              icon: Icon(Icons.library_add, size:30.0)
          ),
          IconButton(
            onPressed: _gotoOptions,
            tooltip: 'Options',
            icon: Icon(Icons.settings),
          ),
        ],
   ),
      body: _buildToDoList(context), 
    );
  }

  void _gotoOptions() async{
    await Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) => OptionsScreen()
          ,)
    );
    setState(() {
      build(context);
    });
  }

  void _gotoCalendar(){
    Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) => Calendar()
          ,)
    );
  }

  void _pushAddToDo() {
    Navigator.of(context).push(
      //TODO: this is a separate page that maybe should be it's own screen file, particularly if it gets more complicated
      // e.g. if you also add some validation to not let you duplicate task names etc.
        new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                  appBar: new AppBar(title: new Text('add a task')
                  ),
                  body: new TextField(
                    autofocus: true,
                    onSubmitted: (val) {
                      Provider.of<TodoModel>(context, listen:false).addTodo(Task(name: val));
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
}