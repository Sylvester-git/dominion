import 'package:dominion/model/health_data.dart';

extension ConvertToHealthDataModel on Map<String, dynamic> {
  HealthDataModel converttohealthdatamodel() {
    return HealthDataModel(
      id: this['id'] as int,
      heart_rate: (this['heart_rate'] as int).toDouble(),
      temperature: this['temperature'] as double,
      blood_pressure: this['blood_pressure'] as String,
      oxygen_stauration: this['oxygen_saturation'] as double,
      uid: this['uid'] as String,
      timestamp: this['recorded_at'] as String,
    );
  }
}
