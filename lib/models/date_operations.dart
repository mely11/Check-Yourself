

class DateOperations{
// This class incorporates some basic operations for getting dates

  String getStringDate(DateTime dateTime){
      // a helper function that grabs and returns date string
      String day = dateTime.day.toString();
      String month = dateTime.month.toString();
      String year = dateTime.year.toString();
      return month+'/'+day+'/'+year;
  }
}