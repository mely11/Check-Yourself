import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:calendar_strip/calendar_strip.dart';
import 'package:todo_app/task_op.dart';
import 'package:todo_app/task.dart';
import 'package:todo_app/todoItem.dart';
import 'calendar.dart';


class TodoList extends StatefulWidget{
  @override
  createState()=> new TodoListState();
}
class TodoListState extends State<TodoList> {
//  @override
//  Widget build(BuildContext context){
//    return new Scaffold(appBar: new AppBar(title: new Text('Check Yourself')));
//  }
  // int index = 0;

  List<Task>_todoItems = [];

  void _addTodo(List buildList, String task) {
    if (task.length > 0) {
      setState(() => _todoItems.add(new Task(task, false)));
      // _saveTodoData();
    }
    // index++;
  }

  Widget _buildToDoItem(List buildList, Task task, int index) {
    Color checkedColor = const Color.fromARGB(0xFF, 0x81, 0xA5, 0xF1);  // the color appears when this checkbox is checked
    Color iconColor = const Color.fromARGB(0xFE, 0xFE, 0xFE, 0xFE); // the color of the check sign within the check box
    return new CheckboxListTile(
          value: timeDilation = buildList[index].done,
          onChanged: (bool value) {
          setState(() { 
              timeDilation = value ? 2.0 : 1.0;
              }
            );
          },
          activeColor: checkedColor, // the color appears when this checkbox is checked
          checkColor: iconColor,
          secondary: IconButton(
            onPressed: () => _promptRemoveToDo(buildList, index),
            icon: Icon(Icons.close),
            color: Colors.red,
          ),
          
          controlAffinity: ListTileControlAffinity.leading,
          title: new Text(task.name)
          
    );
  }

  //   void _checkToDoItem(List thisList, int index) {


  // }

  Widget _buildToDoList(List buildList) {
    return new ListView.builder(
        itemBuilder: (context, index) {
          if (index < buildList.length) {
            return _buildToDoItem(buildList, buildList[index], index);
          }
        }
    );
  }

  @override
  Widget build(BuildContext context){
    // TO DO
    // _getTodoData().then((task){
    //   setState(() {
    //   _todoItems = task;
    //   });
    // });
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
      body: _buildToDoList(_todoItems), 
      floatingActionButton: new FloatingActionButton(
          onPressed: _pushAddToDo,
          tooltip: 'Add task',
          child: new Icon(Icons.add)
      ),
    );
  }

  void _pushAddToDo() {
    print (_todoItems[_todoItems.length - 1].name.toString());
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                  appBar: new AppBar(title: new Text('add a task')
                  ),
                  body: new TextField(
                    autofocus: true,
                    onSubmitted: (task) {
                      _addTodo(_todoItems, task);
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


  void _removeTodo(List thisList, int index) {
    setState(() => _todoItems.removeAt(index));
    // _saveTodoData();
  }

  void _promptRemoveToDo(List thisList, int index) {
    showDialog(context: context, builder: (BuildContext context) {
      return new AlertDialog(
          title: new Text('Delete "${thisList[index]}" ?'),
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.of(context).pop(),
                child: new Text ('Cancel')),
            new FlatButton(
                child: new Text('DELETE'),
                onPressed: () {
                  _removeTodo(thisList, index);
                  Navigator.of(context).pop();
                }
            )
          ]
      );
    }
    );
  }

  // TO DO: THE FOLLOWING NEED TO BE REVISED
  // static Future<List<Task>> _getTodoData() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final todoData = prefs.getStringList('_todoItems');
  //   if (todoData == null){
  //     return [];
  //   }
  //   else{
  //     return todoData;
  //   }
  // }

  // void _saveTodoData() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setStringList('_todoItems', _todoItems);
  // }


}