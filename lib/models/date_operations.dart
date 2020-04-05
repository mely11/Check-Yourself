

class DateOperations{

  String getCurrentDate(){
    DateTime today = DateTime.now();
    return getStringDate(today);
}

  String getStringDate(DateTime dateTime){
    String day = dateTime.day.toString();
    String month = dateTime.month.toString();
    String year = dateTime.year.toString();
    return day+month+year;
  }
}