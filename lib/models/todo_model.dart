import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../globals.dart' as globals;
import '../models/task.dart';
import'../screens/add_todo_screen.dart';
import '../widgets/recur_list.dart';
import '../widgets/recur_list.dart';
import 'recur_list_model.dart';
import 'recur_list_model.dart';
import 'task.dart';

class TodoModel extends ChangeNotifier {
  // This class is a TodoModel that gets an unmodifiable list view of 
  // todoItems, forms a list of Json version of todoItems, incorporates
  // methods that manipulates todoItems, saves changed data, and notifies 
  // listeners the related changes
  List<Task> _todoItems = [];
  String keyDate = globals.setDate;
  String currTask = AddTodoScreenState().typedname;


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
    // This method adds a todoTask into 
    // _todoItems, saves added data, and 
    // notifies the listeners 
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
    final prefs = await SharedPreferences.getInstance();
    final dailyRecur = prefs.getStringList('daily');
    List<String> weekDayRecur;
    _loadDailyRecurrences().then((data) {
      weekDayRecur = data;
    });
    final totalRecur = (weekDayRecur == null) ? dailyRecur: (dailyRecur+weekDayRecur);
    if (totalRecur != null){
      return totalRecur;
    }
    else {return [];}
  }

  Future<List<String>> _loadDailyRecurrences() async{
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
  Future checkfrequency()async{
    final prefs = await SharedPreferences.getInstance();
    if (globals.dailyvalue=true) {
      prefs.getStringList('daily').add(currTask);
      prefs.getStringList('allrecur').add(currTask);

    }
    if (globals.mondayvalue==true) {
      prefs.getStringList('monday').add(currTask.toString());
      prefs.getStringList('allrecur').add(currTask);
      notifyListeners();
      print(prefs.getStringList('monday').toString());

    }
    if (globals.tuesdayvalue==true) {
      prefs.getStringList('tuesday').add(currTask);
      prefs.getStringList('allrecur').add(currTask);
    }
    if (globals.wednesdayvalue==true) {
      prefs.getStringList('wednesday').add(currTask);
      prefs.getStringList('allrecur').add(currTask);
    }
    if (globals.thursdayvalue==true) {
      prefs.getStringList('thursday').add(currTask);
      prefs.getStringList('allrecur').add(currTask);
    }
    if (globals.fridayvalue==true) {
      prefs.getStringList('friday').add(currTask);
      prefs.getStringList('allrecur').add(currTask);
    }
    if (globals.saturdayvalue==true) {
      prefs.getStringList('saturday').add(currTask);
      prefs.getStringList('allrecur').add(currTask);
    }
    if (globals.sundayvalue==true) {
      prefs.getStringList('sunday').add(currTask);
      prefs.getStringList('allrecur').add(currTask);
    }
    else{
      print('lol this did nothing sorry *testing purposes*');
    }
  }

  void refreshAll (){
    // refreshes the page to contain an empty set of todoItem 
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
