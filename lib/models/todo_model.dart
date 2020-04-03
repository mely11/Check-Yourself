import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/task.dart';
import 'dart:convert';

class TodoModel extends ChangeNotifier {

  final List<Task> _todoItems = [];
  
  UnmodifiableListView<Task> get todoItems =>  UnmodifiableListView(_todoItems);

  TodoModel() {
    _getTodoData().then((data){
        _todoItems.addAll(data.map((i) => Task.fromJson(json.decode(i))).toList());
        notifyListeners();
    });
    
  }

  void _addTodo(Task task) {
    _todoItems.add(task);
    notifyListeners();
    _saveTodoData();
  }

  void removeTodoAtIndex(int index) {
    _todoItems.removeAt(index);
    notifyListeners();
    _saveTodoData();
  }

  void removeTodo(Task task) {
    _todoItems.remove(Task);
    notifyListeners();
    _saveTodoData();
  }

  void toggleDone(Task task) {
    final index = _todoItems.indexOf(task);
    _todoItems[index].toggleDone();
    notifyListeners();
    _saveTodoData();
  }

  void _saveTodoData() async{
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedTasks = this._todoItems != null ? this._todoItems.map((i) => json.encode(i.toJson())).toList() : null;
    prefs.setStringList('_todoItems', encodedTasks);
  }

  static Future<List<Task>> _getTodoData() async{
    final prefs = await SharedPreferences.getInstance();
    final todoData = prefs.getStringList('_todoItems');
    if (todoData == null){
      return [];
    }
    else{
      // return todoData;
    }
  }
}
