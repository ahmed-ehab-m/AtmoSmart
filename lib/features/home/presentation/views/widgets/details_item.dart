import 'package:ai_weather/core/styles/text_styles.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({super.key, required this.type, required this.value});
  final String type;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 10.0,
          percent: 0.75,
          center: Text(
            "$value",
            style: AppTextStyles.textStyle22,
          ),
          progressColor: kPrimaryColor,
        ),
        // Text(value, style: AppTextStyles.textStyle38),
        Text(type, style: AppTextStyles.textStyle22),
      ],
    );
  }
}
