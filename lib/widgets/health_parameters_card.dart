import 'package:dominion/features/cubit/get_sensor_data_cubit.dart';
import 'package:dominion/functions.dart';
import 'package:dominion/model/health_parameter.dart';
import 'package:dominion/utils/functions.dart';
import 'package:dominion/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HealthParametersCard extends StatelessWidget {
  const HealthParametersCard({super.key, required this.healthParameter});

  final HealthParameter healthParameter;

  @override
  Widget build(BuildContext context) {
    final getsensorcubit = context.watch<GetSensorDataCubit>();
    return GestureDetector(
      onTap: () {
        naviagationHelper(
          ctx: context,
          healthParameter: healthParameter,
          pagename: healthParameter.parameterTitle,
          healthData: (getsensorcubit.state as GetSensorDataLoaded).healthData,
        );
      },

      child: Container(
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color:
              healthParameter.parameterSI == 'pts'
                  ? getHealthScore(
                    healthscore:
                        double.parse(
                          getParameterValue(
                            name: healthParameter.parameterTitle,
                            data:
                                (getsensorcubit.state as GetSensorDataLoaded)
                                    .healthData
                                    .first,
                          ),
                        ).toInt(),
                  )
                  : healthParameter.parameterCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        width: MediaQuery.sizeOf(context).width * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 4,
          children: [
            Expanded(child: Lottie.asset(healthParameter.paremeterBigIcon)),
            Text(healthParameter.parameterTitle, style: GoogleFonts.roboto()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            (getsensorcubit.state as GetSensorDataLoaded)
                                    .healthData
                                    .isEmpty
                                ? "0"
                                : getParameterValue(
                                  name: healthParameter.parameterTitle,
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
                healthParameter.parameterSmallIcon,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
