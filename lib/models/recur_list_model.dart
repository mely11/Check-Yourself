import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';
import'../screens/add_todo_screen.dart';
import '../globals.dart' as globals;

class RecurListModel extends ChangeNotifier {
  // This class @andrew :D
  List<Task> _recurItems = [];
  String reKey = 'allRecur';

  UnmodifiableListView<Task> get recurItems => UnmodifiableListView(_recurItems);

  RecurListModel() {
    _getRecurData(reKey).then((data) {
      _recurItems.addAll(
          data.map((i) => Task.fromJson(json.decode(i))).toList());
      notifyListeners();
    });
  }


  void removeRecurAtIndex(int index) {
    _recurItems.removeAt(index);
    notifyListeners();
    _saveRecurData(reKey, _recurItems);
  }

  void removeRecur(Task task) {
    // removes a todoTask, saves removed
    // data, and notifies the listeners
    _recurItems.remove(task);
    notifyListeners();
    _saveRecurData(reKey, _recurItems);
    _deleteAllRecurance(task);
  }


  void _saveRecurData(String key, List<Task> data) async{
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedTasks = data != null ? data.map(
            (i) => json.encode(i.toJson())).toList() : null;
    prefs.setStringList(key, encodedTasks);
  }


  Future<List<String>> _getRecurData(String key) async{
    final prefs = await SharedPreferences.getInstance();
    final todoData = prefs.getStringList(key);
    if (todoData == null) {
      return [];
    }
    else{
      return todoData;
    }
  }

  void _deleteAllRecurance(Task task) {
    List<String> keys = ['daily', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];
    List<Task> tasks = [];
    for (var key in keys){
      _getRecurData(key).then((data) {
        tasks.addAll(
            data.map((i) => Task.fromJson(json.decode(i))).toList());
      }
      );
      tasks.remove(task);
      _saveRecurData(key, tasks);
      tasks.clear();
    }
  }

  void refreshAll(){
    _recurItems = [];
    _getRecurData(reKey).then((data) {
      _recurItems.addAll(
          data.map((i) => Task.fromJson(json.decode(i))).toList());
      notifyListeners();
    });
  }

}
