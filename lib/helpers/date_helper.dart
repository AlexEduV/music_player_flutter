
double getSecondsFromTimeString(String time) {

  List<String> timeSplit = time.split(':');

  if (timeSplit.length == 2) {
    return (double.parse(timeSplit[0]) * 60) + double.parse(timeSplit[1]);
  }
  else if (timeSplit.length == 3) {
    return (double.parse(timeSplit[0]) * 60 * 60)
        + (double.parse(timeSplit[1]) * 60)
        + double.parse(timeSplit[2]);
  }
  else {
    throw Exception('Invalid Time: $time');
  }
}
