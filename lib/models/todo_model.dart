import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/task.dart';
import 'dart:convert';
import 'package:todo_app/globals.dart' as globals;


class TodoModel extends ChangeNotifier {
  // This class is a TodoModel that gets an unmodifiable list view of 
  // todoItems, forms a list of Json version of todoItems, incorporates
  // methods that manipulates todoItems, saves changed data, and notifies 
  // listeners the related changes
  List<Task> _todoItems = [];
  String keyDate = globals.setDate;

  UnmodifiableListView<Task> get todoItems => UnmodifiableListView(_todoItems);

  TodoModel() {
    // constructs todoModel using Task class's fromJson method to 
    // parse (decode) the string and return the resulting Json object, 
    // and then forms a list of iterable Task object made out of the 
    // decoded Json object and notifies the listeners
    _getTodoData().then((data) {
      _todoItems.addAll(
          data.map((i) => Task.fromJson(json.decode(i))).toList());
      notifyListeners();
    });
  }

  void addTodo(Task task) {
    // adds a todoTask into _todoItems, 
    // saves added data, and notifies 
    // the listeners 
    _todoItems.add(task);
    notifyListeners();
    _saveTodoData();
  }

  void removeTodoAtIndex(int index) {
    // removes a todoTask with a given 
    // index, saves removed data, 
    // and notifies the listeners 
    _todoItems.removeAt(index);
    notifyListeners();
    _saveTodoData();
  }

  void removeTodo(Task task) {
    // removes a todoTask, saves removed 
    // data, and notifies the listeners 
    _todoItems.remove(task);
    notifyListeners();
    _saveTodoData();
  }


  void toggleDone(Task task) {
    // toggles a task, saves the changed bool 
    // state of a particular Task, and notifies 
    // the listeners 
    final index = _todoItems.indexOf(task);
    _todoItems[index].toggleDone();
    notifyListeners();
    _saveTodoData();
  }

  Future<List<String>> _getTodoData() async{
    // obtains a todo string list or sets to be an empty list of strings
    final prefs = await SharedPreferences.getInstance();
    final todoData = prefs.getStringList(keyDate+'_todoItems');
    if (todoData == null) {
        return [];
      }
    else{
      return todoData;
    }
  }

  void _saveTodoData() async{
    // saves a list of encodedTasks string using map function and json's
    // encode if the todoItem is not null; the Task item would be encoded 
    // to Json object so as to make the task object storable and save data
    // before forming a list of iterable Json object made out of Task object
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedTasks = this._todoItems != null ? this._todoItems.map(
      (i) => json.encode(i.toJson())).toList() : null;
    prefs.setStringList(keyDate+'_todoItems', encodedTasks);
  }

  void refreshAll (){
    // refreshs the page to contain an empty set of todoItem 
    // in the _todoItems list while notifying the listeners
    keyDate = globals.setDate;
    _todoItems = [];
    _getTodoData().then((data) {
      _todoItems.addAll(
          data.map((i) => Task.fromJson(json.decode(i))).toList());
      notifyListeners();
    }
    );
  }


}
