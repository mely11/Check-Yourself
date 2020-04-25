import 'dart:core';

import 'package:Check_Yourself/models/recur_list_model.dart';
import 'package:flutter/material.dart';
import 'package:Check_Yourself/models/todo_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo_model.dart';
import '../models/todo_model.dart';
import '../models/todo_model.dart';
import '../models/todo_model.dart';
import '../screens/calendar.dart';
import '../screens/options_screen.dart';
import '../widgets/todo_list.dart';
import '../models/task.dart';
import 'dart:convert';
import '../globals.dart' as globals;


class AddTodoScreen extends StatefulWidget{
  @override
  createState()=> new AddTodoScreenState();
}
class AddTodoScreenState extends State<AddTodoScreen> {
  String typedname;
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(title: new Text('Add a task')
        ),
        body: new Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              onSubmitted: (val) {
                typedname = val;
              },
              decoration: new InputDecoration(
                  hintText: "What do you want to accomplish?",
                  contentPadding: const EdgeInsets.all(15.0)
              ),
            ),
          ListTile(
            title: Text('When should this task recur?'),
            dense: true,
          ),
          Card(
            child: CheckboxListTile(
              title: Text('Daily'),
              value: globals.dailyvalue,
              onChanged: (bool value){
                setState(() {
                  globals.dailyvalue = value;
                });
              },
              activeColor: Colors.white,
              checkColor: Colors.green,
              dense: true,
            ),
          ),
            Card(
              child: CheckboxListTile(
                title: Text('Sunday'),
                value: globals.sundayvalue,
                onChanged: (bool value){
                  setState(() {
                    globals.sundayvalue = value;
                  });
                },
                activeColor: Colors.white,
                checkColor: Colors.green,
                dense: true,
              ),
            ),
            Card(
              child: CheckboxListTile(
                title: Text('Monday'),
                value: globals.mondayvalue,
                onChanged: (bool value){
                  setState(() {
                    globals.mondayvalue = value;
                  });
                },
                activeColor: Colors.white,
                checkColor: Colors.green,
                dense: true,
              ),
            ),
            Card(
              child: CheckboxListTile(
                title: Text('Tuesday'),
                value: globals.tuesdayvalue,
                onChanged: (bool value){
                  setState(() {
                    globals.tuesdayvalue = value;
                  });
                 },
                activeColor: Colors.white,
                checkColor: Colors.green,
                dense: true,
              ),
            ),
            Card(
              child: CheckboxListTile(
                title: Text('Wednesday'),
                value: globals.wednesdayvalue,
                onChanged: (bool value){
                  setState(() {
                    globals.wednesdayvalue = value;
                  });
                },
                activeColor: Colors.white,
                checkColor: Colors.green,
                dense: true,
              ),
            ),
            Card(
              child: CheckboxListTile(
                title: Text('Thursday'),
                value: globals.thursdayvalue,
                onChanged: (bool value){
                  setState(() {
                    globals.thursdayvalue = value;
                  });
                },
                activeColor: Colors.white,
                checkColor: Colors.green,
                dense: true,
              ),
            ),
            Card(
              child: CheckboxListTile(
                title: Text('Friday'),
                value: globals.fridayvalue,
                onChanged: (bool value){
                  setState(() {
                    globals.fridayvalue = value;
                  });
                },
                activeColor: Colors.white,
                checkColor: Colors.green,
                dense: true,
              ),
            ),
            Card(
              child: CheckboxListTile(
                title: Text('Saturday'),
                value: globals.saturdayvalue,
                onChanged: (bool value){
                  setState(() {
                    globals.saturdayvalue = value;
                  });
                },
                activeColor: Colors.white,
                checkColor: Colors.green,
                dense: true,
              ),
            ),
            RaisedButton(
              onPressed: () => _submitTask(),
              child: Text('Add Task')
            ),
          ],
        )
    );
  }

  void _submitTask() async {
    Provider.of<TodoModel>(context, listen: false).addTodo(
        Task(name: typedname));
    await checkFrequency(typedname);
    globals.dailyvalue = false;
    globals.mondayvalue = false;
    globals.tuesdayvalue = false;
    globals.wednesdayvalue = false;
    globals.thursdayvalue = false;
    globals.fridayvalue = false;
    globals.saturdayvalue = false;
    globals.sundayvalue = false;
    Navigator.pop(context);
  }

  void checkFrequency(String taskName) async{
    Task currTask = new Task(name: taskName);
    String encodedCurrTask = json.encode(currTask.toJson());
    final prefs = await SharedPreferences.getInstance();
    globals.recurModelInit = true;
    if (globals.dailyvalue==true) {
      List<String> recurList = prefs.getStringList('daily');
      if (recurList == null){
        recurList = [];
      }
      recurList.add(encodedCurrTask);
      prefs.setStringList('daily', recurList);
      _checkAllRecur(encodedCurrTask);
    }
    if (globals.mondayvalue==true) {
      List<String> recurList = prefs.getStringList('monday');
      if (recurList == null){
        recurList = [];
      }
      recurList.add(encodedCurrTask);
      prefs.setStringList('monday', recurList);
      print ('added stuff from monday');
      _checkAllRecur(encodedCurrTask);
    }
    if (globals.tuesdayvalue==true) {
      List<String> recurList = prefs.getStringList('tuesday');
      if (recurList == null){
        recurList = [];
      }
      recurList.add(encodedCurrTask);
      prefs.setStringList('tuesday', recurList);
      _checkAllRecur(encodedCurrTask);
    }
    if (globals.wednesdayvalue==true) {
      List<String> recurList = prefs.getStringList('wednesday');
      if (recurList == null){
        recurList = [];
      }
      recurList.add(encodedCurrTask);
      prefs.setStringList('wednesday', recurList);
      _checkAllRecur(encodedCurrTask);
    }
    if (globals.thursdayvalue==true) {
      List<String> recurList = prefs.getStringList('thursday');
      if (recurList == null){
        recurList = [];
      }
      recurList.add(encodedCurrTask);
      prefs.setStringList('thursday', recurList);
      _checkAllRecur(encodedCurrTask);
    }
    if (globals.fridayvalue==true) {
      List<String> recurList = prefs.getStringList('friday');
      if (recurList == null){
        recurList = [];
      }
      recurList.add(encodedCurrTask);
      prefs.setStringList('friday', recurList);
      _checkAllRecur(encodedCurrTask);
    }
    if (globals.saturdayvalue==true) {
      List<String> recurList = prefs.getStringList('saturday');
      if (recurList == null){
        recurList = [];
      }
      recurList.add(encodedCurrTask);
      prefs.setStringList('saturday', recurList);
      _checkAllRecur(encodedCurrTask);
    }
    if (globals.sundayvalue==true) {
      List<String> recurList = prefs.getStringList('sunday');
      if (recurList == null){
        recurList = [];
      }
      recurList.add(encodedCurrTask);
      prefs.setStringList('sunday', recurList);
      _checkAllRecur(encodedCurrTask);
    }
    else{
      print('lol this did nothing sorry *testing purposes*');
    }
  }

  void _checkAllRecur(String encodedTask) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> allRecur = prefs.getStringList('allRecur');
    if (allRecur == null){
      allRecur = [];
    }
    if (!allRecur.contains(encodedTask)){
      allRecur.add(encodedTask);
      prefs.setStringList('allRecur', allRecur);
      Provider.of<RecurListModel>(context, listen: false).refreshAll();
      print('added to recur model');
    }
  }

}