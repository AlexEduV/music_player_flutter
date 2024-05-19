
import 'package:flutter/widgets.dart';

double getSecondsFromTimeString(String time) {

  debugPrint('time -> double: init value: $time');

  //convert string to list
  List<String> timeSplit = time.split(':');

  double result = 0;

  if (timeSplit.length == 2) {
    result = (double.parse(timeSplit[0]) * 60) + double.parse(timeSplit[1]);
  }
  else if (timeSplit.length == 3) {
    result = (double.parse(timeSplit[0]) * 60 * 60)
        + (double.parse(timeSplit[1]) * 60)
        + double.parse(timeSplit[2]);
  }
  else {
    throw Exception('Invalid Time: $time');
  }

  debugPrint('time -> double: result: $result');

  return result;
}

String getTimeStringFromDouble(double timeInSeconds) {

  debugPrint('double -> time: init value: $timeInSeconds');

  //convert to int
  int secondsInt = timeInSeconds.toInt();

  int hours = secondsInt ~/ 3600;
  secondsInt = secondsInt % 3600;

  int minutes = secondsInt ~/ 60;
  secondsInt = secondsInt % 60;

  int seconds = secondsInt;

  //compose the result
  String result = '';

  if (hours > 0) {
    result += '$hours:';
  }

  result += '$minutes:${seconds.toString().padLeft(2, '0')}';

  debugPrint('double -> time: result: $result');

  return result;

}
