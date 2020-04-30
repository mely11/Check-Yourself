// enumerate days
enum Day {
  DAILY,
  SATURDAY,
  SUNDAY,
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY
}

String getStringRepresentingDay(Day day) {
  // this method converts a Day object that represents
  // a particular day to a lowercased string using split
  // toString, and toLowerCase methods
  return day.toString().split(".")[1].toLowerCase();
}
