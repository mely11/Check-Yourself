import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globals.dart' as globals;
import 'date_operations.dart';
import 'task.dart';

class TodoModel extends ChangeNotifier {
  // This class is a TodoModel that gets an unmodifiable list view of 
  // todoItems, forms a list of Json version of todoItems, incorporates
  // methods that manipulates todoItems, saves changed data, and notifies 
  // listeners the related changes
  List<Task> _todoItems = [];
  String keyDate = DateOperations().getStringDate(globals.setDate);

  // creates an unmodifiable list backed by todoItems
  UnmodifiableListView<Task> get todoItems => UnmodifiableListView(_todoItems);

  TodoModel() {
    // constructs todoModel using Task class's fromJson method to 
    // parse (decode) the string and return the resulting Json object, 
    // and then forms a list of iterable Task object made out of the 
    // decoded Json object and notifies/calls all the registered listeners 
    _getTodoData().then((data) {
      _todoItems.addAll(
          data.map((i) => Task.fromJson(json.decode(i))).toList());
      notifyListeners();
    });
  }

  void addTodo(Task task) {
    // This method adds a todoTask into 
    // _todoItems, saves added data, and 
    // notifies/calls all the registered listeners 
    _todoItems.add(task);
    notifyListeners();
    _saveTodoData();
  }

  void removeTodoAtIndex(int index) {
    // removes a todoTask with a given 
    // index, saves removed data, and notifies,
    // or calls, all the registered listeners 
    _todoItems.removeAt(index);
    notifyListeners();
    _saveTodoData();
  }

  void removeTodo(Task task) {
    // removes a todoTask, saves removed 
    // data, and notifies/calls all the 
    // registered listeners 
    _todoItems.remove(task);
    notifyListeners();
    _saveTodoData();
  }


  void toggleDone(Task task) {
    // toggles a task, saves the changed bool 
    // state of a particular Task, and notifies, 
    // or calls, all the registered listeners 
    final index = _todoItems.indexOf(task);
    _todoItems[index].toggleDone();
    notifyListeners();
    _saveTodoData();
  }

  Future<List<String>> _getTodoData() async{
    // obtains a to-do string list or sets to be an empty list of strings
    final prefs = await SharedPreferences.getInstance();
    final todoData = prefs.getStringList(keyDate+'_todoItems');
    if (todoData == null) {
      return _loadRecurrences();
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

  Future<List<String>> _loadRecurrences() async{
    // loads the recurrences using await and loadDailyRecurrences 
    // if theweekDayRecur is null and dailyRecur is not null,
    // then the recur items are daily recurrences, so adds them
    // into a newly-created totalRecur list of strings; otherwise, 
    // they recurred in particular weekday(s) so we add the 
    // corresponding weekDayRecur into totalRecur
    final prefs = await SharedPreferences.getInstance();
    List<String> dailyRecur = prefs.getStringList('daily');
    List<String> weekDayRecur;
    await _loadDailyRecurrences().then((data) {
      weekDayRecur = data;
    });
    if (weekDayRecur == null){
      if (dailyRecur == null){
        return [];
      }
      else{
        return dailyRecur;}
    }
    else{
      List<String> totalRecur = [];
      if (dailyRecur != null){
        totalRecur.addAll(dailyRecur);
      }
      totalRecur.addAll(weekDayRecur);
      return totalRecur;
    }
  }

  Future<List<String>> _loadDailyRecurrences() async{
    // loads the daily recurrences by setting today as an integer 
    // and returns the corresponding string list of that day
    final prefs = await SharedPreferences.getInstance();
    int today = globals.weekDay;
    if (today == 1) { return prefs.getStringList('monday');}
    if (today == 2) { return prefs.getStringList('tuesday');}
    if (today == 3) { return prefs.getStringList('wednesday');}
    if (today == 4) { return prefs.getStringList('thursday');}
    if (today == 5) { return prefs.getStringList('friday');}
    if (today == 6) { return prefs.getStringList('saturday');}
    if (today == 7) { return prefs.getStringList('sunday');}
    else {return null;}

  }

  void refreshAll () async{
    // refreshes the page to contain an empty set of todoItem in the 
    // _todoItems list while notify/call all the registered listeners 
    keyDate = DateOperations().getStringDate(globals.setDate);
    _todoItems = [];
    await _getTodoData().then((data) {
      _todoItems.addAll(
          data.map((i) => Task.fromJson(json.decode(i))).toList());
    }
    );
    _saveTodoData();
    notifyListeners();
  }

}
