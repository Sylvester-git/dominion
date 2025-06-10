// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:dominion/features/cubit/get_sensor_data_cubit.dart';
import 'package:dominion/functions.dart';
import 'package:dominion/model/health_parameter.dart';
import 'package:dominion/widgets/glass_morph_container.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class FullHealthParameterScreen extends StatelessWidget {
  const FullHealthParameterScreen({
    super.key,
    required this.healthParameter,
    required this.healthData,
  });

  final HealthParameter healthParameter;
  final List healthData;

  @override
  Widget build(BuildContext context) {
    final getsensorcubit = context.watch<GetSensorDataCubit>();
    List<Color> gradientColors = [
      healthParameter.parameterCardColor,
      healthParameter.parameterCardColor.withOpacity(.8),
    ];

    List<FlSpot> generateWeeklyChartData() {
      Random random = Random();
      int totalPoints = 7; // Ensuring x values are at most 7 (0 to 7)

      List<FlSpot> spots = [];

      // First value should have a max y value of 7
      spots.add(FlSpot(0, 7.0));

      // Generate the rest of the values randomly
      for (int i = 1; i <= totalPoints; i++) {
        double xValue = i.toDouble(); // Ensuring x values are between 0 to 7
        double yValue = random.nextDouble() * 7; // Y values between 0 and <7
        spots.add(FlSpot(xValue, yValue));
      }

      return spots;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(healthParameter.parameterTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 2,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        horizontalInterval: 1,
                        verticalInterval: 1,
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),

                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                '${value.toStringAsFixed(1)} ${healthParameter.parameterSI}',
                              );
                            },
                            reservedSize: 60,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,

                        border: Border.all(color: const Color(0xff37434d)),
                      ),
                      minX: 0,
                      maxX: 7,
                      minY: 0,
                      maxY: 7,
                      lineBarsData: [
                        LineChartBarData(
                          isCurved: true,
                          spots: generateWeeklyChartData(),
                          barWidth: 5,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          gradient: LinearGradient(colors: gradientColors),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors:
                                  gradientColors
                                      .map(
                                        (color) => color.withValues(alpha: 0.3),
                                      )
                                      .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: GlassMorphWidget(
                        color: healthParameter.parameterCardColor.withOpacity(
                          .9,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  healthParameter.parameterTitle,
                                  style: GoogleFonts.roboto(fontSize: 16),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            (getsensorcubit.state
                                                        as GetSensorDataLoaded)
                                                    .healthData
                                                    .isEmpty
                                                ? "0"
                                                : getParameterValue(
                                                  name:
                                                      healthParameter
                                                          .parameterTitle,
                                                  data:
                                                      (getsensorcubit.state
                                                              as GetSensorDataLoaded)
                                                          .healthData
                                                          .first,
                                                ),
                                        style: GoogleFonts.saira(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: healthParameter.parameterSI,
                                        style: GoogleFonts.roboto(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Lottie.asset(
                                healthParameter.parameterFullScreenIcon,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
