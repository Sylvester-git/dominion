import 'dart:developer';

import 'package:dominion/app/app.dart';
import 'package:dominion/app/dependency_inj.dart';
import 'package:dominion/config/config.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigServices.loadConfig();
  await init();
  log(ConfigServices.isLoaded.toString());
  runApp(MyApp());
}
