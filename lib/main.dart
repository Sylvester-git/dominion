import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:dominion/app/app.dart';
import 'package:dominion/app/dependency_inj.dart';
import 'package:dominion/config/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigServices.loadConfig();
  await init();
  log(ConfigServices.isLoaded.toString());
  runApp(MyApp());
}
