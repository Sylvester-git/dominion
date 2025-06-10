import "package:dominion/model/health_data.dart";
import "package:dominion/model/health_parameter.dart";
import "package:dominion/features/screens/full_health_parameter_screen.dart";

import "package:flutter/material.dart";

Future<void> pushNavigation({required BuildContext ctx, required Widget page}) {
  return Navigator.push(ctx, MaterialPageRoute(builder: (context) => page));
}

Future<void> pushReplacementNavigation({
  required BuildContext ctx,
  required Widget page,
}) {
  return Navigator.pushReplacement(
    ctx,
    MaterialPageRoute(builder: (context) => page),
  );
}

void popNavigation({required BuildContext ctx, required Widget page}) {
  Navigator.pop(ctx);
}

List getHealthData({
  required String pagename,
  required List<HealthDataModel> healthData,
}) {
  switch (pagename.toLowerCase()) {
    case "heart rate":
      return healthData.map((data) => data.heart_rate).toList();
    case "blood pressure":
      return healthData.map((data) => data.blood_pressure).toList();
    case "temperature":
      return healthData.map((data) => data.temperature).toList();
    case "oxygen saturation":
      return healthData.map((data) => data.oxygen_stauration).toList();
    default:
      return healthData;
  }
}

naviagationHelper({
  required BuildContext ctx,
  required String pagename,
  required HealthParameter healthParameter,
  required List<HealthDataModel> healthData,
}) {
  switch (pagename.toLowerCase()) {
    case 'health score':
      throw Exception('$pagename does not exist');
    default:
      return pushNavigation(
        ctx: ctx,
        page: FullHealthParameterScreen(
          healthParameter: healthParameter,
          healthData: getHealthData(pagename: pagename, healthData: healthData),
          isBloodpressure: healthParameter.parameterSI == "mmHg",
        ),
      );
  }
}
