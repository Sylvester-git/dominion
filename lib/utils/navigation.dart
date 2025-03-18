import "package:dominion/model/health_parameter.dart";
import "package:dominion/pages/screens/full_health_parameter_screen.dart";

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

naviagationHelper({
  required BuildContext ctx,
  required String pagename,
  required HealthParameter healthParameter,
}) {
  switch (pagename.toLowerCase()) {
    case 'health score':
      throw Exception('$pagename does not exist');
    default:
      return pushNavigation(
        ctx: ctx,
        page: FullHealthParameterScreen(healthParameter: healthParameter),
      );
  }
}
