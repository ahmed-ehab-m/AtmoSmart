import 'package:ai_weather/core/utils/strings.dart';
import 'package:ai_weather/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AccountCheckRow extends StatelessWidget {
  const AccountCheckRow(
      {super.key, required this.onPressed, required this.type});
  final void Function() onPressed;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            type == AppStrings.signUp
                ? AppStrings.dontHaveAnAccount
                : AppStrings.alreadyHaveAnAccount,
            style: AppStyles.textStyle18),
        TextButton(
            onPressed: onPressed,
            child: Text(
              type == AppStrings.signUp ? AppStrings.signUp : AppStrings.login,
              style:
                  AppStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
