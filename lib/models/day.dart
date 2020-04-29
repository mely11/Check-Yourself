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
  return day.toString().split(".")[1].toLowerCase();
}
