import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'recur_list_model.dart';
import 'task.dart';
import 'day.dart';

class SharedPreferencesStorage {
  // This class controls and builds the SharedPreferencesStorage 
  static SharedPreferencesStorage _singleton;

  static SharedPreferencesStorage getInstance() {
    // gets/initializes the SharedPreferencesStorage object
    if (_singleton == null) {
      _singleton = new SharedPreferencesStorage();
    }
    return _singleton;
  }

  addTaskToRecurringDay(BuildContext context, Task task, Day day) async {
    // adds encoded task strings to the recurList in _getPreferenceOrInitialize,
    // saves the recurList of strings as value of each key in the form of dayname
    // string to persistent storage in the background so that an input task is 
    // added to the recurList and then its recur day is set to be its key
    String dayname = getStringRepresentingDay(day);
    List<String> recurList = await _getPreferenceOrInitialize(dayname);

    String encodedTask = _encodeTask(task);
    if (!recurList.contains(encodedTask)) {
      recurList.add(encodedTask);
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList(dayname, recurList);
      _refreshModels(context);
    }
  }

  addTaskToAllRecurringTasksList(BuildContext context, Task task) async {
    // adds all the encoded tasks to the recurList
    List<String> recurList = await _getPreferenceOrInitialize('allRecur');

    String encodedTask = _encodeTask(task);
    if (!recurList.contains(encodedTask)) {
      recurList.add(encodedTask);
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('allRecur', recurList);
      _refreshModels(context);
    }
  }

  Future<List<String>> _getPreferenceOrInitialize(String name) async {
    // uses getInstance method to load and parse the SharedPreferences
    // for this app from disk to prefs and uses getStringList method to 
    // read a set of string values from the persistent storage; since
    // it will throw an exception if it's not a string set or list is
    // null, we manually initialize recurList = [] and return otherwise
    final prefs = await SharedPreferences.getInstance();
    List<String> recurList = prefs.getStringList(name);
    if (recurList == null) {
      recurList = [];
    }
    return recurList;
  }

  String _encodeTask(Task task) {
    // converts a Task object to a JSON string
    return json.encode(task.toJson());
  }

  _refreshModels(BuildContext context) {
    // using refreshAll in RecurListModel to get and update the recurrence data
    Provider.of<RecurListModel>(context, listen: false).refreshAll();
  }
}
