import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Check_Yourself/models/recur_list_model.dart';
import 'package:Check_Yourself/widgets/recur_list.dart';

class EditRecuranceScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => EditRecurScreenState();
}

class EditRecurScreenState extends State<EditRecuranceScreen>{


  Widget _buildRecurTaskList(BuildContext context){
    return Consumer<RecurListModel>(
      builder: (context, recurs, child) => RecurList(recurItems: recurs.recurItems)
    );
  }

  @override
  Widget build(BuildContext context) {
    // This creates the buildOptionsList
    return new Scaffold(
        appBar: AppBar(
          title: Text ('Recurring Tasks'),
        ),
        body: _buildRecurTaskList(context),
    );

  }

}