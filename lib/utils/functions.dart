import 'package:intl/intl.dart';

String getGreeting() {
  if (DateTime.now().hour > 6 && DateTime.now().hour < 12) {
    return 'Morining, ';
  }
  if (DateTime.now().hour > 12 && DateTime.now().hour < 18) {
    return 'Afternoon, ';
  } else {
    return 'Evening, ';
  }
}

String getDateTime() {
  return DateFormat().add_jm().format(DateTime.now());
}
