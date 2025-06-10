import 'package:equatable/equatable.dart';

class HealthDataModel extends Equatable {
  final int id;
  final double heart_rate;
  final double temperature;
  final String blood_pressure;
  final double oxygen_stauration;
  final String uid;
  final String timestamp;

  const HealthDataModel({
    required this.id,
    required this.heart_rate,
    required this.temperature,
    required this.blood_pressure,
    required this.oxygen_stauration,
    required this.uid,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [
    id,
    heart_rate,
    temperature,
    blood_pressure,
    oxygen_stauration,
    uid,
    timestamp,
  ];
}
