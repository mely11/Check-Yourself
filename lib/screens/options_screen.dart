import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/globals.dart' as globals;
import 'package:todo_app/models/date_operations.dart';
import 'package:todo_app/models/todo_model.dart';

class OptionsScreen extends StatefulWidget{
  // This class creates a new options screen state as a stateful widget
  @override
  createState()=> new OptionsScreenState();
}

class OptionsScreenState extends State<OptionsScreen>{
  // This class builds the option list in a screen, including icons for
  // editRecurringTask, promptDataDelete, and a variety of user data options
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
            onTap: () => _editRecurringTask(),
            title: Text('Edit Recuring Tasks'),
            subtitle: Text('rn a test button for moving between pages'),
            leading: Icon(Icons.add_box, color: Colors.lightBlue),
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
    // This creates the buildOptionsList
    return new Scaffold(
      appBar: AppBar(
        title: Text ('Options'),
      ),
      body: _buildOptionsList(context)
    );

  }

  void _promptDataDelete(BuildContext context){
    // This method creates a prompt alerting task deletion
    showDialog(context: context, builder: (BuildContext context) {
      return new AlertDialog(
          title: Text('Delete ALL User Data?'),
          content: Text('This will load a blank checklist'),
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.of(context).pop(),
                child: Text ('Cancel')),
            new FlatButton(
                child: Text('DELETE ALL'),
                onPressed: () {
                  _deleteData();
                  Navigator.of(context).pop();
                }
            )
          ]
      );
    }
    );
  }

  void _deleteData() async{
    // This method deletes the pressed task
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print ('data deleted');
    globals.setDate = DateOperations().getCurrentDate();
    Provider.of<TodoModel> (context, listen: false).refreshAll();
    Navigator.of(context).pop();
  }

  //NOTE: THIS IS CURRENTLY NOT ACTUALLY A METHOD TO EDIT RECURRING TASKS
  //SINCE THE BUTTON WAS THERE AND ON A DIFFERENT SCREEN I'VE BEEN USING IT TO TEST
  //DATA REFRESHING IN MOVING BACK AND FORTH BETWEEN THE TODOLISTSCREEN
  void _editRecurringTask(){
    // This method edits the recurring task
    globals.setDate = 'ruecr';
    Provider.of<TodoModel> (context, listen: false).refreshAll();
    print ('editing tasks');
    print (Provider.of<TodoModel>(context, listen: false).keyDate);
    Navigator.of(context).pop();
  }

}