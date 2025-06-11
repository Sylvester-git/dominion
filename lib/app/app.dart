import 'package:dominion/app/provider.dart';
import 'package:dominion/features/login.dart';
import 'package:dominion/utils/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp._();
  static final instance = MyApp._();
  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return getProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        theme: getTheme(),
      ),
    );
  }
}
