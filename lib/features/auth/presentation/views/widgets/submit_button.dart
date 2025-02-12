import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {super.key, required this.onPressed, required this.buttonChild});
  final void Function() onPressed;
  final Widget buttonChild;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        textStyle:
            AppTextStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      // child: Text(buttonChild, style: AppStyles.textStyle22),
      child: buttonChild,
    );
  }
}
