import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HealthParameter {
  final String parameterTitle;
  final String parameterValue;
  final Color parameterCardColor;
  final Widget parameterSmallIcon;
  final Widget? parameterPage;
  final String paremeterBigIcon;
  final String parameterFullScreenIcon;
  final String parameterSI;

  const HealthParameter({
    required this.parameterTitle,
    required this.parameterValue,
    required this.parameterCardColor,
    required this.parameterSmallIcon,
    this.parameterPage,
    required this.parameterFullScreenIcon,
    required this.paremeterBigIcon,
    required this.parameterSI,
  });
}

List<HealthParameter> healthParameter = [
  HealthParameter(
    parameterTitle: 'Health Score',
    parameterValue: '61.3',
    parameterSI: 'pts',
    parameterCardColor: Colors.tealAccent.shade200,
    parameterSmallIcon: Icon(Icons.healing_rounded, color: Colors.teal),
    paremeterBigIcon: 'assets/lottie/healthscore.json',
    parameterFullScreenIcon: 'assets/lottie/healthscore.json',
  ),
  HealthParameter(
    parameterTitle: 'Heart Rate',
    parameterValue: '175',
    parameterSI: 'bpm',
    parameterCardColor: Colors.redAccent.shade100,
    parameterSmallIcon: Icon(Icons.favorite_rounded, color: Colors.red),
    paremeterBigIcon: 'assets/lottie/heart.json',
    parameterFullScreenIcon: 'assets/lottie/heart_rate.json',
  ),
  HealthParameter(
    parameterTitle: 'Blood Pressure',
    parameterValue: '120/80',
    parameterSI: 'mmHg',
    parameterCardColor: Colors.redAccent.shade100,
    parameterSmallIcon: Icon(Icons.bloodtype, color: Colors.red),
    paremeterBigIcon: 'assets/lottie/blood_pressure1.json',
    parameterFullScreenIcon: 'assets/lottie/blood_pressure2.json',
  ),
  HealthParameter(
    parameterTitle: 'Temperature',
    parameterValue: '36.4',
    parameterSI: '℃',
    parameterCardColor: Colors.redAccent.shade100,
    parameterSmallIcon: Icon(Icons.thermostat_rounded, color: Colors.red),
    paremeterBigIcon: 'assets/lottie/temperature.json',
    parameterFullScreenIcon: 'assets/lottie/temperature.json',
  ),
  HealthParameter(
    parameterTitle: 'Oxygen Saturation',
    parameterValue: '96',
    parameterSI: '%',
    parameterCardColor: Colors.blueAccent.shade100,
    parameterSmallIcon: Icon(Icons.air_rounded, color: Colors.blue),
    paremeterBigIcon: 'assets/lottie/oxygen.json',
    parameterFullScreenIcon: 'assets/lottie/oxygen.json',
  ),
];
