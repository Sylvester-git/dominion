import 'dart:developer';

import 'package:dominion/utils/storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:dominion/app/app.dart';
import 'package:dominion/app/dependency_inj.dart';
import 'package:dominion/config/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigServices.loadConfig();
  await init();
  await instance<Storage>().initHive();
  log(ConfigServices.isLoaded.toString());
  runApp(MyApp());
}
