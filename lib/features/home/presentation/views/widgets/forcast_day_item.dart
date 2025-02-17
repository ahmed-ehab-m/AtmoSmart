import 'package:ai_weather/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ForcastDayItem extends StatelessWidget {
  const ForcastDayItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kPrimaryColor.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            children: [
              Text(
                'Fri',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                '5',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
