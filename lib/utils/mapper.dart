import 'package:dominion/model/health_data.dart';

extension ConvertToHealthDataModel on Map<String, dynamic> {
  HealthDataModel converttohealthdatamodel() {
    return HealthDataModel(
      id: this['id'] as int,
      heart_rate: this['heart_rate'] as int,
      temperature: this['temperature'] as double,
      blood_pressure: this['blood_pressure'] as String,
      oxygen_stauration: this['oxygen_stauration'] as double,
      uid: this['uid'] as String,
      timestamp: this['timestamp'] as String,
    );
  }
}
