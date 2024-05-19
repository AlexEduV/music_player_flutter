
import 'package:flutter/widgets.dart';

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

String getTimeStringFromDouble(double timeInSeconds) {

  debugPrint('time -> double: init value: $timeInSeconds');

  //convert to int
  int secondsInt = timeInSeconds.toInt();

  int hours = secondsInt ~/ 3600;
  secondsInt = secondsInt ~/ 3600;

  int minutes = secondsInt ~/ 60;
  secondsInt = secondsInt ~/ 60;

  int seconds = secondsInt;

  //compose the result
  String result = '';

  if (hours > 0) {
    result += '$hours:';
  }

  result += '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

  debugPrint('time -> double: result: $result');

  return result;

}
