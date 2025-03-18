import 'package:dominion/model/health_parameter.dart';
import 'package:dominion/widgets/health_parameters_card.dart';
import 'package:flutter/material.dart';

class HealthGridView extends StatelessWidget {
  const HealthGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(left: 16, top: 20, bottom: 30),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 16 / 9,
          mainAxisExtent: 200,
          crossAxisSpacing: 5,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return HealthParametersCard(healthParameter: healthParameter[index]);
        },
        itemCount: healthParameter.length,
      ),
    );
  }
}
