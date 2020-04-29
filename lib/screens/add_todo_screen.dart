import 'dart:core';

import 'package:Check_Yourself/models/day.dart';
import 'package:Check_Yourself/models/add_todo_model.dart';
import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  createState() => new AddTodoScreenState();
}

class AddTodoScreenState extends State<AddTodoScreen> {
  AddTodoModel addTodoModel = new AddTodoModel();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: _makeBackgroundColor(),
        appBar: _makeAppBar(),
        body: _makeBody());
  }

  Color _makeBackgroundColor() {
    return Color.fromARGB(0xFE, 0xFE, 0xFE, 0xFE);
  }

  AppBar _makeAppBar() {
    return new AppBar(title: new Text('Add a task'));
  }

  Column _makeBody() {
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
    return TextField(
      autofocus: true,
      onSubmitted: (val) {
        addTodoModel.setTaskName(val);
      },
      decoration: new InputDecoration(
          hintText: "What do you want to accomplish?",
          contentPadding: const EdgeInsets.all(15.0)),
    );
  }

  ListTile _makeAskRecurText() {
    return ListTile(
      title: Text('When should this task recur?'),
      dense: true,
    );
  }

  Column _makeDayCards() {
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
    return RaisedButton(
        onPressed: () => _submitTask(), child: Text('Check yourself'));
  }

  Card _buildCardWithLabel(AddTodoScreenState state, Day day) {
    return Card(
        child: CheckboxListTile(
      title: Text(_capitalizeString(getStringRepresentingDay(day))),
      value: addTodoModel.getWillRecurOnDay(day),
      onChanged: (bool value) {
        // ignore: invalid_use_of_protected_member
        state.setState(() {
          addTodoModel.setWillRecurOnDay(day, value);
        });
      },
      activeColor: Colors.white,
      checkColor: Colors.green,
      dense: true,
    ));
  }

  String _capitalizeString(String str) {
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
