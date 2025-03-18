import 'package:dominion/pages/home.dart';
import 'package:dominion/utils/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp._();
  static final instance = MyApp._();
  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: getTheme(),
    );
  }
}
