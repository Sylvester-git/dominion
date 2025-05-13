import 'package:dominion/model/health_data.dart';

double calculateHealthScore(
  double temperature,
  int heartRate,
  int systolicBp,
  int diastolicBp,
  double oxygenSaturation,
) {
  /*
   * Calculate a health score based on vital signs.
   *
   * Parameters:
   *   temperature: Body temperature in Celsius (e.g., 36.6)
   *   heartRate: Heart rate in beats per minute (e.g., 80)
   *   systolicBp: Systolic blood pressure in mmHg (e.g., 120)
   *   diastolicBp: Diastolic blood pressure in mmHg (e.g., 80)
   *   oxygenSaturation: Oxygen saturation percentage (e.g., 98.0)
   *
   * Returns:
   *   double: Health score between 0 and 100
   */

  // Define standard healthy ranges and weights
  final ranges = {
    'temperature': {
      'optimal': [36.1, 37.2],
      'tolerable': [35.0, 38.0],
      'weight': 0.2,
    },
    'heartRate': {
      'optimal': [60.0, 100.0],
      'tolerable': [40.0, 120.0],
      'weight': 0.3,
    },
    'systolicBp': {
      'optimal': [90.0, 120.0],
      'tolerable': [80.0, 140.0],
      'weight': 0.2,
    },
    'diastolicBp': {
      'optimal': [60.0, 80.0],
      'tolerable': [50.0, 90.0],
      'weight': 0.15,
    },
    'oxygenSaturation': {
      'optimal': [95.0, 100.0],
      'tolerable': [90.0, 100.0],
      'weight': 0.15,
    },
  };

  // Helper function to score a single parameter
  double scoreParameter(
    double value,
    List<double> optimalRange,
    List<double> tolerableRange,
  ) {
    final optimalMin = optimalRange[0];
    final optimalMax = optimalRange[1];
    final tolerableMin = tolerableRange[0];
    final tolerableMax = tolerableRange[1];

    if (value >= optimalMin && value <= optimalMax) {
      return 100.0; // Optimal range
    } else if (value >= tolerableMin && value <= tolerableMax) {
      // Linear interpolation between 50 (edge of tolerable) and 100 (edge of optimal)
      if (value < optimalMin) {
        return 50.0 +
            50.0 * (value - tolerableMin) / (optimalMin - tolerableMin);
      } else {
        return 50.0 +
            50.0 * (tolerableMax - value) / (tolerableMax - optimalMax);
      }
    } else {
      return 0.0; // Outside tolerable range
    }
  }

  // Calculate individual scores
  final tempScore = scoreParameter(
    temperature,
    ranges['temperature']!['optimal'] as List<double>,
    ranges['temperature']!['tolerable'] as List<double>,
  );
  final hrScore = scoreParameter(
    heartRate.toDouble(),
    ranges['heartRate']!['optimal'] as List<double>,
    ranges['heartRate']!['tolerable'] as List<double>,
  );
  final sysBpScore = scoreParameter(
    systolicBp.toDouble(),
    ranges['systolicBp']!['optimal'] as List<double>,
    ranges['systolicBp']!['tolerable'] as List<double>,
  );
  final diaBpScore = scoreParameter(
    diastolicBp.toDouble(),
    ranges['diastolicBp']!['optimal'] as List<double>,
    ranges['diastolicBp']!['tolerable'] as List<double>,
  );
  final oxyScore = scoreParameter(
    oxygenSaturation,
    ranges['oxygenSaturation']!['optimal'] as List<double>,
    ranges['oxygenSaturation']!['tolerable'] as List<double>,
  );

  // Calculate weighted total score with explicit casting
  final totalScore =
      tempScore * (ranges['temperature']!['weight'] as double) +
      hrScore * (ranges['heartRate']!['weight'] as double) +
      sysBpScore * (ranges['systolicBp']!['weight'] as double) +
      diaBpScore * (ranges['diastolicBp']!['weight'] as double) +
      oxyScore * (ranges['oxygenSaturation']!['weight'] as double);

  return (totalScore * 100).roundToDouble() / 100; // Round to 2 decimal places
}

String getParameterValue({
  required String name,
  required HealthDataModel data,
}) {
  switch (name) {
    case 'Health Score':
      return calculateHealthScore(
        data.temperature,
        data.heart_rate,
        int.parse(data.blood_pressure.replaceAll('mmHG', '').split('/')[0]),
        int.parse(data.blood_pressure.replaceAll('mmHG', '').split('/')[1]),
        data.oxygen_stauration,
      ).toString();
    case 'Heart Rate':
      return data.heart_rate.toString();
    case 'Blood Pressure':
      return data.blood_pressure.replaceAll('mmHG', '');
    case 'Oxygen Saturation':
      return data.oxygen_stauration.toStringAsFixed(1);
    case 'Temperature':
      return data.temperature.toString();
    default:
      return '';
  }
}
