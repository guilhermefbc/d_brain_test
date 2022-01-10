class DateUtil {
  static formatDateAndTime(DateTime date) {
    return formatDate(date) + " " + formatTime(date);
  }

  static String formatDate(DateTime date) {
    String day = _concatZero(date.day);
    String month = _concatZero(date.month);
    String year = _concatZero(date.year);

    return day + "/" + month + "/" + year;
  }

  static String formatTime(DateTime date) {
    String hour = _concatZero(date.hour);
    String minute = _concatZero(date.minute);
    String second = _concatZero(date.second);

    return hour + ":" + minute + ":" + second;
  }

  static String _concatZero(int dateTimeElement) {
    if(dateTimeElement < 10) {
      return "0" + dateTimeElement.toString();
    }else{
      return dateTimeElement.toString();
    }
  }
}