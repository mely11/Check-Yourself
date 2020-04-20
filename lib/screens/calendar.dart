// import 'package:Check_Yourself/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:calendar_strip/calendar_strip.dart';
import 'package:Check_Yourself/globals.dart' as globals;
import 'package:Check_Yourself/models/date_operations.dart';
// import 'package:provider/provider.dart';
// import '../models/todo_model.dart';

class Calendar extends StatefulWidget{
  // This class creates a new calendar screen state as a stateful widget
  @override
  createState()=> new CalendarScreenState();
}

class CalendarScreenState extends State<Calendar> {
  // This class sets up a calendar state 
  DateTime startDate = DateTime.now().subtract(Duration(days: 15));
  DateTime endDate = DateTime.now().add(Duration(days: 15));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 2));
  List<DateTime> markedDates = [
    DateTime.now(),
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().add(Duration(days: 1))
  ];

  onSelect(data) {
    // onSelect method reassigns the global 'setDate' variable, 
    // updates the todo list screen, and returns the user to said screen
    String selectedDate = DateOperations().getStringDate(data);
    globals.setDate = selectedDate;
    print("Selected Date -> $data");
    // if (selectedDate != DateOperations().getCurrentDate) {
      // Provider.of<TodoModel> (context, listen: false).refreshAll();
    // }
    
  }

  _monthNameWidget(monthName) {
    // monthNameWidget method returns the container widget creating month names
    return Container(
      child: Text(monthName,
          style:
          TextStyle(fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontStyle: FontStyle.italic)),
      padding: EdgeInsets.only(top: 8, bottom: 4),
    );
  }

  getMarkedIndicatorWidget() {
    // getMarkedIndicatorWidget method returns the getMarkedIndicator widget 
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(date, selectedDate, rowIndex, dayName, isDateMarked,
      isDateOutOfRange) {
    // dateTileBuilder method builds the date tile and animates the container
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
    TextStyle normalStyle = TextStyle(
        fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black87);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // build method builds the calendar
    return Scaffold(
      appBar: AppBar(
        title: Text('Calender'),
      ),
      body: Container(
          child: CalendarStrip(
            startDate: startDate,
            endDate: endDate,
            onDateSelected: onSelect,
            dateTileBuilder: dateTileBuilder,
            iconColor: Colors.black87,
            monthNameWidget: _monthNameWidget,
            markedDates: markedDates,
            containerDecoration: BoxDecoration(color: Colors.black12),
          )
          //child: TodoModel(

          //)
        ),
    );
  }
}

