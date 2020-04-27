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
   Color iconColor = const Color.fromARGB(0xFE, 0xFE, 0xFE, 0xFE); 
    return new Scaffold(
      backgroundColor: iconColor,
      appBar: new AppBar(
        title: new Text('Todo List: '+DateOperations().getStringDate(globals.setDate)),
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

//  void _pushAddToDo() {
//    // creates/pops up a new page for adding a task and uses Provider to call the corresponding
//    // addTodo method in TodoModel, which handles adding and saving new task
//    Navigator.of(context).push(
//      //TO DO: this is a separate page that maybe should be its own screen file,
//      // nparticularly if it gets more complicated
//      // e.g. if you also add some validation to not let you duplicate task names etc.
//        new MaterialPageRoute(
//            builder: (context) {
//              return new Scaffold(
//                  appBar: new AppBar(title: new Text('add a task')
//                  ),
//                  body: new TextField(
//                    autofocus: true,
//                    onSubmitted: (val) {
//                      Provider.of<TodoModel>(context, listen:false).addTodo(Task(name: val));
//                      Navigator.pop(context);
//                    },
//                    decoration: new InputDecoration(
//                        hintText: "What do you want to accomplish?",
//                        contentPadding: const EdgeInsets.all(15.0)
//                    ),
//                  )
//              );
//            })
//    );
//  }
}