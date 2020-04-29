import 'dart:convert';

import 'package:Check_Yourself/models/recur_list_model.dart';
import 'package:Check_Yourself/models/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'day.dart';

class SharedPreferencesStorage {
  static SharedPreferencesStorage _singleton;

  static SharedPreferencesStorage getInstance() {
    if (_singleton == null) {
      _singleton = new SharedPreferencesStorage();
    }
    return _singleton;
  }

  addTaskToRecurringDay(BuildContext context, Task task, Day day) async {
    String dayname = getStringRepresentingDay(day);
    List<String> recurList = await _getPreferenceOrInitialize(dayname);

    String encodedTask = _encodeTask(task);
    recurList.add(encodedTask);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(dayname, recurList);
    _refreshModels(context);
  }

  addTaskToAllRecurringTasksList(BuildContext context, Task task) async {
    List<String> recurList = await _getPreferenceOrInitialize('allRecur');

    String encodedTask = _encodeTask(task);
    recurList.add(encodedTask);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('allRecur', recurList);
    _refreshModels(context);
  }

  Future<List<String>> _getPreferenceOrInitialize(String name) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recurList = prefs.getStringList(name);
    if (recurList == null) {
      recurList = [];
    }
    return recurList;
  }

  String _encodeTask(Task task) {
    return json.encode(task.toJson());
  }

  _refreshModels(BuildContext context) {
    Provider.of<RecurListModel>(context, listen: false).refreshAll();
  }
}
