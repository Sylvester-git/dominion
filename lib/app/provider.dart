import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

MultiBlocProvider getProviders({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      // Add your Bloc providers here
    ],
    child: child,
  );
}
