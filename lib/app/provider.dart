import 'package:dominion/app/dependency_inj.dart';
import 'package:dominion/features/cubit/get_sensor_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

MultiBlocProvider getProviders({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      // Add your Bloc providers here
      BlocProvider(create: (context) => instance<GetSensorDataCubit>()),
    
    ],
    child: child,
  );
}
