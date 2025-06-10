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

(double, double) convertBPtoDouble({required String bp}) {
  final split = bp.replaceAll('mmHG', '').split('/');
  final fval = double.parse(split[0]);
  final sval = double.parse(split[1]);
  return (fval, sval);
}
