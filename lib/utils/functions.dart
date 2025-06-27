import 'package:flutter/material.dart';
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

List<double> splitLast7Values(List<double> values, {int steps = 7}) {
  if (values.isEmpty) return [];

  final maxValue = values.reduce((a, b) => a > b ? a : b);
  final interval = maxValue / (steps - 1);

  return List.generate(
    steps,
    (i) => double.parse((i * interval).toStringAsFixed(1)),
  );
}

Color getHealthScore({required int healthscore}) {
  if (healthscore <= 100 && healthscore >= 70) {
    return Colors.tealAccent.shade200;
  }
  if (healthscore < 70 && healthscore >= 50) {
    return Colors.orangeAccent.shade200;
  } else {
    return Colors.redAccent.shade200;
  }
}
