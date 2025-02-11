import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/core/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    required this.validator,
  });

  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
        TextFormField(
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: kPrimaryColor.withValues(alpha: 0.1),
            border: buildOutlineInputBorder(),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            // hintText: hintText,
            // hintStyle: AppStyles.textStyle18.copyWith(color: Colors.white),
            // labelText: labelText,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
