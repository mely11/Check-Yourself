import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OptionsScreen extends StatelessWidget{

  Widget _buildOptionsList(BuildContext context){
    return new ListView(
      children: <Widget>[
        ListTile(
          title: Text('Recurring Task Options:'),
          dense: true,
          leading: Icon(Icons.assignment_turned_in, size: 30.0, color: Colors.amber),
        ),
        Card(
          child: ListTile(
            onTap: () => _addRecurringTask(),
            title: Text('Add a Recurring Task'),
            leading: Icon(Icons.add_box, color: Colors.lightBlue),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () => _removeRecurringTask(),
            title: Text('Remove a Recurring Task'),
            leading: Icon(Icons.cancel, color: Colors.redAccent),
          ),
        ),
        ListTile(
          title: Text('User Data Options:'),
          dense: true,
          leading: Icon(Icons.person, size: 35.0, color: Colors.blue),
        ),
        Card(
            child: ListTile(
                onTap: () => _promptDataDelete(context),
                title: Text('Delete All User Data'),
              leading: Icon(Icons.delete),
            )
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text ('Options'),
      ),
      body: _buildOptionsList(context)
    );

  }

  void _promptDataDelete(BuildContext context){
    showDialog(context: context, builder: (BuildContext context) {
      return new AlertDialog(
          title: new Text('Delete ALL User Data?'),
          content: new Text('This will close Check Yourself'),
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.of(context).pop(),
                child: new Text ('Cancel')),
            new FlatButton(
                child: new Text('DELETE ALL'),
                onPressed: () {
                  _deleteData();
                }
            )
          ]
      );
    }
    );
  }

  void _deleteData() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print ('data deleted');
    SystemNavigator.pop();
  }

  void _addRecurringTask(){
    print ('add a task');
  }

  void _removeRecurringTask(){
    print ('remove a task');
  }

}