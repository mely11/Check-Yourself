import 'dart:collection';

import 'package:flutter/cupertino.dart';
<<<<<<< HEAD
import 'package:todo_app/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';
=======
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/task.dart';
>>>>>>> 8399bf51e05bd22a8b3bb1577b608f6ad2681837
import 'dart:convert';

class TodoModel extends ChangeNotifier {

  final List<Task> _todoItems = [];
<<<<<<< HEAD

  UnmodifiableListView<Task> get todoItems => UnmodifiableListView(_todoItems);

  TodoModel() {
    _getTodoData().then((data){
      _todoItems.addAll(data.map((i) => Task.fromJson(json.decode(i))).toList());
      notifyListeners();
=======
  
  UnmodifiableListView<Task> get todoItems =>  UnmodifiableListView(_todoItems);

  TodoModel() {
    _getTodoData().then((data){
        _todoItems.addAll(data.map((i) => Task.fromJson(json.decode(i))).toList());
        notifyListeners();
>>>>>>> 8399bf51e05bd22a8b3bb1577b608f6ad2681837
    });
    
  }

<<<<<<< HEAD
  void addTodo(Task task) {
     _todoItems.add(task);
     notifyListeners();
      _saveTodoData(); 
=======
  void _addTodo(Task task) {
    _todoItems.add(task);
    notifyListeners();
    _saveTodoData();
>>>>>>> 8399bf51e05bd22a8b3bb1577b608f6ad2681837
  }

  void removeTodoAtIndex(int index) {
    _todoItems.removeAt(index);
    notifyListeners();
    _saveTodoData();
  }

<<<<<<< HEAD
  void removeTodo(Task task){
    _todoItems.remove(task);
=======
  void removeTodo(Task task) {
    _todoItems.remove(Task);
>>>>>>> 8399bf51e05bd22a8b3bb1577b608f6ad2681837
    notifyListeners();
    _saveTodoData();
  }

<<<<<<< HEAD
  void toggleDone(Task task){
=======
  void toggleDone(Task task) {
>>>>>>> 8399bf51e05bd22a8b3bb1577b608f6ad2681837
    final index = _todoItems.indexOf(task);
    _todoItems[index].toggleDone();
    notifyListeners();
    _saveTodoData();
  }

<<<<<<< HEAD
static Future<List<String>> _getTodoData() async{
=======
  void _saveTodoData() async{
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedTasks = this._todoItems != null ? this._todoItems.map((i) => json.encode(i.toJson())).toList() : null;
    prefs.setStringList('_todoItems', encodedTasks);
  }

  static Future<List<Task>> _getTodoData() async{
>>>>>>> 8399bf51e05bd22a8b3bb1577b608f6ad2681837
    final prefs = await SharedPreferences.getInstance();
    final todoData = prefs.getStringList('_todoItems');
    if (todoData == null){
      return [];
    }
    else{
<<<<<<< HEAD
      return todoData;
    }
  }

  void _saveTodoData() async{
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedTasks = this._todoItems != null ? this._todoItems.map((i) => json.encode(i.toJson())).toList() : null;
    prefs.setStringList('_todoItems', encodedTasks);
  }

}
=======
      // return todoData;
    }
  }
}
>>>>>>> 8399bf51e05bd22a8b3bb1577b608f6ad2681837
