library datetime_ext;

extension DateTimeExt on DateTime {

  int lastMonthDayOfGivenQuarter(int quarter) {
    int lastDayOfMonth = 31;
    switch (quarter) {
      case 1:
        lastDayOfMonth = 31;
        break;
      case 2:
        lastDayOfMonth = 30;
        break;
      case 3:
        lastDayOfMonth = 30;
        break;
      case 4:
        lastDayOfMonth = 31;
        break;
    }
    return lastDayOfMonth;
  }

  DateTime get endOfQuarter {
    final DateTime lastDateOfMonth = DateTime(year, currentQuarter * 3, lastMonthDayOfGivenQuarter(currentQuarter));
    return lastDateOfMonth.add(const Duration(hours: 23, minutes: 59, seconds: 59, milliseconds: 999));
  }

  DateTime endOfGivenQuarter(int quarter) {
    // Check if the quarter is valid.
    if (quarter < 1 || quarter > 4) {
      throw ArgumentError('Quarter must be between 1 and 4.');
    }

    // Get the last day of the month for the given quarter.


    // Create a new DateTime object for the last day of the month.
    final DateTime lastDateOfMonth = DateTime(year, quarter * 3 + 1, lastMonthDayOfGivenQuarter(quarter));

    // Add 23 hours, 59 minutes, 59 seconds, and 999 milliseconds to the date.
    return lastDateOfMonth.add(const Duration(hours: 23, minutes: 59, seconds: 59, milliseconds: 999));
  }

  int get currentQuarter {
    return (month - 1).floor() ~/ 3 + 1;
  }

  DateTime get endOfYear {

    // Create a new DateTime object for the end of the year.
    DateTime endOfYear = DateTime(year, 12, 31, 23, 59, 59, 999);

    // Return the new DateTime object.
    return endOfYear;
  }

  DateTime get endOfMonth {
    // Create a new DateTime object for the end of the month.
    DateTime endOfMonth = DateTime(year, month + 1, 0, 23, 59, 59, 999);

    // Return the new DateTime object.
    return endOfMonth;
  }
}