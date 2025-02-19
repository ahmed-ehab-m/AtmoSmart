import 'package:ai_weather/core/styles/text_styles.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem(
      {super.key,
      required this.type,
      required this.value,
      required this.color});
  final String type;
  final dynamic value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        CircularPercentIndicator(
          backgroundColor: Colors.white.withAlpha(50),
          radius: 50.0,
          lineWidth: 10.0,
          percent: value.toDouble() / 100,
          center: Text(
            "$value%",
            style: AppTextStyles.textStyle22.copyWith(color: color),
          ),
          progressColor: kPrimaryColor,
        ),
        // Text(value, style: AppTextStyles.textStyle38),
        Text(
          type,
          style: AppTextStyles.textStyle22.copyWith(color: kPrimaryColor),
        ),
      ],
    );
  }
}
