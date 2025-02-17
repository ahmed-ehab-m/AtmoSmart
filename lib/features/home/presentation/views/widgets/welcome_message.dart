import 'package:ai_weather/core/styles/text_styles.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Hello',
          style: AppTextStyles.textStyle38.copyWith(color: kPrimaryColor)),
      Text(
        userName,
        style: AppTextStyles.textStyle22
            .copyWith(fontWeight: FontWeight.normal, color: Colors.grey[700]),
      )
    ]);
  }
}
