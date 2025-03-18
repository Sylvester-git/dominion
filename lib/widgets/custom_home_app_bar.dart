import 'package:dominion/utils/functions.dart';
import 'package:dominion/widgets/health_metrics.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 60, 16, 16),
      decoration: BoxDecoration(
        color: Colors.tealAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Circle avatar and name row
              Row(
                spacing: 7,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: Center(
                      child: Icon(Icons.person, color: Colors.blueGrey),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      Text(
                        '${getGreeting()}Dominion',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          HealthMetrics(
                            icon: Icon(Icons.access_time),
                            txt: getDateTime(),
                          ),
                          HealthMetrics(
                            icon: Icon(Icons.healing_rounded),
                            txt: 'Healthy',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // Notification bell
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.teal.shade900,
                ),
                child: Center(
                  child: Icon(Icons.notifications_active, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
