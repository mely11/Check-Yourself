import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/calendar.dart';
import 'package:todo_app/screens/options_screen.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/globals.dart' as globals;


class TodoListScreen extends StatefulWidget{
  // This class builds TodoListScreenState as a stateful widget
  @override
  createState()=> new TodoListScreenState();
}
class TodoListScreenState extends State<TodoListScreen> {
  // this class creates a TodoList using Consumer for state management
  Widget _buildToDoList(BuildContext context){
    return Consumer<TodoModel>(
      builder: (context, todos, child) => TodoList(todoItems: todos.todoItems)
    );
  }


  @override
  Widget build(BuildContext context){
    // builds all the buttons with their actions as well as the todoList
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List: '+globals.setDate),
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
    // Creates and pushes a new options screen state that builds the option list
    await Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) => OptionsScreen()
          ,)
    );
    setState(() {
      build(context);
    });
  }

  void _gotoCalendar(){
    // Creates a calendar and pushes to the calendar page
    Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) => Calendar()
          ,)
    );
  }

  void _pushAddToDo() {
    // creates/pops up a new page for adding a task and uses Provider to call the corresponding 
    // addTodo method in TodoModel, which handles adding and saving new task
    Navigator.of(context).push(
      //TODO: this is a separate page that maybe should be its own screen file, particularly if it gets more complicated
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