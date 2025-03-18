import 'package:flutter/material.dart';

class HealthMetrics extends StatelessWidget {
  const HealthMetrics({super.key, required this.icon, required this.txt});

  final Widget icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Row(spacing: 4, children: [icon, Text(txt)]);
  }
}
