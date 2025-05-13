import 'dart:async';
import 'dart:developer';

import 'package:dominion/app/app.dart';
import 'package:dominion/config/config.dart';
import 'package:flutter/material.dart';

void main() async {
  runZonedGuarded(
    () async {
      await ConfigServices.loadConfig();
      log(ConfigServices.isLoaded.toString());
      runApp(MyApp());
    },
    (error, stackTrace) {
      log('Error: $error');
      log('StackTrace: $stackTrace');
    },
  );
}
