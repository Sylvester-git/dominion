import 'package:dominion/model/health_data.dart';

extension ConvertToHealthDataModel on Map<String, dynamic> {
  HealthDataModel converttohealthdatamodel() {
    return HealthDataModel(
      id: this['id'],
      heart_rate: this['heart_rate'],
      temperature: double.parse((this['temperature'].toString())),
      blood_pressure: this['blood_pressure'] as String,
      oxygen_stauration: this['oxygen_saturation'] as double,
      uid: this['uid'] as String,
      timestamp: this['recorded_at'] as String,
    );
  }
}
