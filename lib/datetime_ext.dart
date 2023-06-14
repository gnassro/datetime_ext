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

  DateTime get startOfQuarter {
    return DateTime(year, (currentQuarter * 3) - 2, 1);
  }

  DateTime endOfGivenQuarter(int quarter) {

    if (quarter < 1 || quarter > 4) {
      throw ArgumentError('Quarter must be between 1 and 4.');
    }

    final DateTime lastDateOfMonth = DateTime(year, quarter * 3 + 1, lastMonthDayOfGivenQuarter(quarter));

    return lastDateOfMonth.add(const Duration(hours: 23, minutes: 59, seconds: 59, milliseconds: 999));
  }

  int get currentQuarter {
    return (month - 1).floor() ~/ 3 + 1;
  }

  DateTime get endOfYear {

    DateTime endOfYear = DateTime(year, 12, 31, 23, 59, 59, 999);

    return endOfYear;
  }

  DateTime get startOfYear {

    DateTime endOfYear = DateTime(year);

    return endOfYear;
  }

  DateTime get endOfMonth {

    DateTime endOfMonth = DateTime(year, month + 1, 0, 23, 59, 59, 999);

    return endOfMonth;
  }

  DateTime get startOfMonth {

    DateTime endOfMonth = DateTime(year, month);

    return endOfMonth;
  }
}