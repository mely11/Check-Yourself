import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calendar.dart';
import 'options_screen.dart';
import 'add_todo_screen.dart';

import '../models/todo_model.dart';
import '../widgets/todo_list.dart';
import '../globals.dart' as globals;
import '../models/date_operations.dart';


class TodoListScreen extends StatefulWidget{
  // This class builds TodoListScreenState mutable state
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
    // builds all the buttons with their actions as well as the todoList; 
    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(255, 66, 177, 227),
        title: new Text('Todo List: '+DateOperations().getStringDate(globals.setDate),
          style: 
          TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white)),
        actions: <Widget>[
          IconButton(
              onPressed: _gotoAddTodo,
              tooltip: 'Add task',
              icon: Icon(Icons.library_add, size:30.0)
          ),
          IconButton(
            onPressed: _gotoCalendar,
            tooltip: 'Open Calendar',
            icon: Icon(Icons.calendar_today,),
          ),
          IconButton(
            onPressed: _gotoOptions,
            tooltip: 'Options',
            icon: Icon(Icons.settings),
          ),
        ],
   ),
       body: Stack(
            children: <Widget>[
            Container(
              child: new Image.asset(
                 'assets/images/background.png',
                  width: screenSize.width,
                  height: screenSize.height,
                  fit: BoxFit.fill,
                  color: Colors.white10,
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            _buildToDoList(context)
          ]
       )
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

  void _gotoCalendar() async{
    // Creates a calendar and pushes to the calendar page
    await Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) => Calendar()
          ,)
    );
    setState(() {
      build(context);
    });
  }
  void _gotoAddTodo(){
    // Creates a calendar and pushes to the calendar page
    Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) => AddTodoScreen()
          ,)
    );
  }
}