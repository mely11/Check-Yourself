import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/recur_list.dart';
import '../models/recur_list_model.dart';

class EditRecuranceScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => EditRecurScreenState();
}

class EditRecurScreenState extends State<EditRecuranceScreen>{
  // This class controls the edit-recur screen state

  Widget _buildRecurTaskList(BuildContext context){
    // This build recurList consisting of recurItems
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