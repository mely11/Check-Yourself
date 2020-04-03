import 'package:flutter/material.dart';
import 'package:calendar_strip/calendar_strip.dart';
import 'package:todo_app/screens/calendar.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/models/task.dart';


class TodoListScreen extends StatefulWidget{
  @override
  createState()=> new TodoListScreenState();
}
class TodoListScreenState extends State<TodoListScreen> {
//  @override
//  Widget build(BuildContext context){
//    return new Scaffold(appBar: new AppBar(title: new Text('Check Yourself')));
//  }

  Widget _buildToDoList(BuildContext context){
    return Consumer<TodoModel>(
      builder: (context, todos, child) => TodoList(todoItems: todos.todoItems)
    );
  }


  @override
  Widget build(BuildContext context){
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Check Yourself'),
        // TO DO:
        // INTEGRATE THIS CALENDAR PART INTO THE CURRENT TO DO LIST
    //   body: Container(
    //       child: CalendarStrip(
    //       startDate: startDate,
    //       endDate: endDate,
    //       onDateSelected: onSelect,
    //       dateTileBuilder: dateTileBuilder,
    //       iconColor: Colors.black87,
    //       monthNameWidget: _monthNameWidget,
    //       markedDates: markedDates,
    //       containerDecoration: BoxDecoration(color: Colors.black12),
    ),
      body: _buildToDoList(context), 
      floatingActionButton: new FloatingActionButton(
          onPressed: _pushAddToDo,
          tooltip: 'Add task',
          child: new Icon(Icons.add)
      ),
    );
  }

  void _pushAddToDo() {
    Navigator.of(context).push(
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