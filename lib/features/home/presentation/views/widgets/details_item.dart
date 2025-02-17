import 'package:ai_weather/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({super.key, required this.type, required this.value});
  final String type;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppTextStyles.textStyle38),
        Text(type, style: AppTextStyles.textStyle18),
      ],
    );
  }
}
