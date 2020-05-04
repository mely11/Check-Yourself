import 'package:flutter/material.dart';
import 'dart:core';

import '../models/day.dart';
import '../models/add_todo_model.dart';

class AddTodoScreen extends StatefulWidget {
  // This class creates a new AddTodoScreenState mutable state
  @override
  createState() => new AddTodoScreenState();
}

class AddTodoScreenState extends State<AddTodoScreen> {
  // This class creates a new addTodoModel 
  AddTodoModel addTodoModel = new AddTodoModel();

  @override
  Widget build(BuildContext context) {
    // builds and returns the decorated Widget
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _makeAppBar(),
      body: _makeBody()
    );
  }

  AppBar _makeAppBar() {
    // makes the AppBar to be titled
    return new AppBar(title: new Text('Add a task', 
          style: 
          TextStyle(fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.white)),
      backgroundColor: Color.fromARGB(255, 66, 177, 227));
  }

  Column _makeBody() {
    // makes the TextField to be task name,
    // ListTile to display intended texts,
    // and makes submit buttom and day cards
    return new Column(
      children: <Widget>[
        _makeTaskNameTextField(),
        _makeAskRecurText(),
        _makeDayCards(),
        _makeSubmitButton(),
      ],
    );
  }

  TextField _makeTaskNameTextField() {
    // uses onSubmitted to set task name in addTodoModel
    return TextField(
      cursorColor: Color.fromARGB(255, 66, 177, 227),
      autofocus: true,
      decoration: new InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 66, 177, 227), width: 2.1),
        ),
        hintText: "What do you want to accomplish?",
        contentPadding: const EdgeInsets.all(15.0)),
        onSubmitted: (val) {
          addTodoModel.setTaskName(val != null ? val : '');
      },
 );
  }

  ListTile _makeAskRecurText() {
    // returns the intended ListTile
    return ListTile(
      title: Text('When should this task recur?', style: TextStyle(fontSize: 15.9)),
      dense: true,
    );
  }
        // highlightColor: Color(0xffdfeaf4),

  Column _makeDayCards() {
    // returns new Column as a vertical array of children
    // that builds all the days labelled cards
    return new Column(children: <Widget>[
      _buildCardWithLabel(this, Day.DAILY),
      _buildCardWithLabel(this, Day.SATURDAY),
      _buildCardWithLabel(this, Day.SUNDAY),
      _buildCardWithLabel(this, Day.MONDAY),
      _buildCardWithLabel(this, Day.TUESDAY),
      _buildCardWithLabel(this, Day.WEDNESDAY),
      _buildCardWithLabel(this, Day.THURSDAY),
      _buildCardWithLabel(this, Day.FRIDAY),
    ]);
  }

  RaisedButton _makeSubmitButton() {
    // creates a filled button using RaisedButton and uses
    // onPressed function to call submitTask functions
    return RaisedButton(
      elevation: 5,
      padding: EdgeInsets.only(
        left: 145,
        right: 145),
      highlightColor: Color(0xffdfeaf4),
      onPressed: () => _submitTask(), 
      child: Text('Check yourself!', style: TextStyle(fontSize: 15.7)));
  }

  Card _buildCardWithLabel(AddTodoScreenState state, Day day) {
    // creates and returns a material design card, makes onchanged
    // to be called when the value of the checkbox should change and 
    // setWillRecurOnDay method in addTodoModel to set the given recur
    // days, and finally sets the color to use for both the check icon 
    // and the check box when given checkbox(s) is (are) checked
    return Card(
      margin: EdgeInsets.all(2.1),
      child: CheckboxListTile(
          title: Text(_capitalizeString(getStringRepresentingDay(day)), style: TextStyle(fontSize: 14.57)),
          value: addTodoModel.getWillRecurOnDay(day),
          onChanged: (bool value) {
            // ignore: invalid_use_of_protected_member
          state.setState(() {
            addTodoModel.setWillRecurOnDay(day, value);
          },
        );
      },
      activeColor: Colors.white,
      checkColor: Colors.blue[200],
      dense: true,
    ));
  }

  String _capitalizeString(String str) {
    // capitalizes an input string object
    return "${str[0].toUpperCase()}${str.substring(1)}";
  }

  void _submitTask() async {
    // submits a task via adding it using addTodo method in
    // the TodoModel and Provider class, checks the frequency
    // of the typedname stored in the AddTodoScreenState
    addTodoModel.createTask(context);
    Navigator.pop(context);
  }
}
