import 'dart:async';

import 'package:dominion/features/cubit/get_sensor_data_cubit.dart';
import 'package:dominion/widgets/custom_home_app_bar.dart';
import 'package:dominion/widgets/health_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;
  @override
  void initState() {
    reloadPeriodically();
    super.initState();
  }

  void reloadPeriodically() async {
    timer = Timer.periodic(const Duration(seconds: 180), (timer) {
      context.read<GetSensorDataCubit>().refreshSensorData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomHomeAppBar(),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Health Metrics',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          BlocBuilder<GetSensorDataCubit, GetSensorDataState>(
            builder: (context, getsensorstate) {
              if (getsensorstate is GetSensorDataLoading ||
                  getsensorstate is GetSensorDataInitial) {
                return Center(child: CircularProgressIndicator());
              } else if (getsensorstate is GetSensorDataLoaded) {
                return HealthGridView();
              } else if (getsensorstate is GetSensorDataError) {
                return Center(
                  child: Text('Error: ${getsensorstate.failure.message}'),
                );
              }
              return Center(child: Text('Error: }'));
            },
          ),
        ],
      ),
    );
  }
}
