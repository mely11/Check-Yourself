import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'task.dart';
import '../globals.dart' as globals;

class RecurListModel extends ChangeNotifier {
  // This class builds and handles recur list model
  List<Task> _recurItems = [];
  String reKey = 'allRecur';

  UnmodifiableListView<Task> get recurItems => UnmodifiableListView(_recurItems);

  RecurListModel() {
    // constructor for building the recurrence list model
    if (globals.recurModelInit == false) {
      _getRecurData(reKey).then((data) {
        _recurItems.addAll(
            data.map((i) => Task.fromJson(json.decode(i))).toList());
        notifyListeners();
      });
    }
  }

  void removeRecurAtIndex(int index) {
    // removes a recurItem at a specific index,
    // saves removed data, and notifies the listeners
    _recurItems.removeAt(index);
    notifyListeners();
    _saveRecurData(reKey, _recurItems);
  }

  void removeRecur(Task task) async {
    // removes a todoTask, saves removed
    // data, and notifies the listeners
    _recurItems.remove(task);
    notifyListeners();
    _saveRecurData(reKey, _recurItems);
    _deleteAllRecurrence(json.encode(task.toJson()));
  }


  void _saveRecurData(String key, List<Task> data) async{
    // save recurrence data as a list of encodedTasks strings
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedTasks = data != null ? data.map(
            (i) => json.encode(i.toJson())).toList() : null;
    prefs.setStringList(key, encodedTasks);
  }


  Future<List<String>> _getRecurData(String key) async{
    // grabs the recurrence data 
    final prefs = await SharedPreferences.getInstance();
    final todoData = prefs.getStringList(key);
    if (todoData == null) {
      return [];
    }
    else{
      return todoData;
    }
  }

  void _deleteAllRecurrence(String task) async {
    // deletes the recurrence data  by removing the task str
    final prefs = await SharedPreferences.getInstance();
    List<String> keys = ['daily', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];
    List<String> tasks = [];
    for (var key in keys){
      tasks = prefs.getStringList(key);
      if (tasks != null) {
        print('here are the tasks before');
        print(tasks);
        tasks.remove(task);
        print('here are the tasks after');
        print(tasks);
        prefs.setStringList(key, tasks);
        tasks.clear();
      }
    }
    print ('all recurrences deleted');
  }

  void refreshAll(){
    // gets the recurrence data while notify listeners
    _recurItems = [];
    _getRecurData(reKey).then((data) {
      _recurItems.addAll(
          data.map((i) => Task.fromJson(json.decode(i))).toList());
      notifyListeners();
    });
  }


}
