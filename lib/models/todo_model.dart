import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/task.dart';
import 'dart:convert';
import 'package:todo_app/globals.dart' as globals;


class TodoModel extends ChangeNotifier {

  final List<Task> _todoItems = [];
  final String keyDate = globals.setDate;

  UnmodifiableListView<Task> get todoItems => UnmodifiableListView(_todoItems);

  TodoModel() {
    _getTodoData().then((data) {
      _todoItems.addAll(
          data.map((i) => Task.fromJson(json.decode(i))).toList());
      notifyListeners();
    });
  }


  void addTodo(Task task) {
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
    _todoItems.remove(task);
    notifyListeners();
    _saveTodoData();
  }


  void toggleDone(Task task) {
    final index = _todoItems.indexOf(task);
    _todoItems[index].toggleDone();
    notifyListeners();
    _saveTodoData();
  }

  Future<List<String>> _getTodoData() async{

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
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedTasks = this._todoItems != null ? this._todoItems.map((i) => json.encode(i.toJson())).toList() : null;
    prefs.setStringList(keyDate+'_todoItems', encodedTasks);
  }


}
