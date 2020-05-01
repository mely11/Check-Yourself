import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';

// SharedPreferences wraps NSUserDefaults (on iOS) and SharedPreferences 
// (on Android), providing a persistent store for simple data
import 'package:shared_preferences/shared_preferences.dart';

import 'task.dart';
import '../globals.dart' as globals;

class RecurListModel extends ChangeNotifier {
  // This class builds and handles recur list model
  List<Task> _recurItems = [];
  String reKey = 'allRecur';

  // creates an unmodifiable list backed by recurItems
  UnmodifiableListView<Task> get recurItems => UnmodifiableListView(_recurItems);

  RecurListModel() {
    // constructor for building the recurrence list model by adding  
    // all the recurItems to a newly-created list of Task using its 
    // fromJson method that constructs a new Task instance from a 
    // map structure, along with the json.decode method to decode 
    // fromJson and convert back, and finally notified listeners
    // will call notifyListeners method whenever the object changes
    // so as to notify any clients the object may have
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
    // saves recurrence data as a list of encodedTasks strings
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedTasks = data != null ? data.map(
            (i) => json.encode(i.toJson())).toList() : null;
    prefs.setStringList(key, encodedTasks);
  }


  Future<List<String>> _getRecurData(String key) async{
    // grabs the recurrence data using SharedPreferences 
    // loading and parseing it for this app from disk.
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
    // deletes all the recurrence data by removing all the 
    // enumerated string list (named keys), along with the
    // task string from the obtained list pref 
    final prefs = await SharedPreferences.getInstance();
    List<String> keys = ['daily', 'monday', 'tuesday', 
    'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];
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
    // gets the recurrence data, appends all objects of iterable tasks
    // to the end of the recurItems list while using mapping and fromJson 
    // method that parses the string and returns the resulting Json object, 
    // and finally notifys (call) all the registered listeners
    _recurItems = [];
    _getRecurData(reKey).then((data) {
      _recurItems.addAll(
          data.map((i) => Task.fromJson(json.decode(i))).toList());
      notifyListeners();
    });
  }


}
