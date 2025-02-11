import 'package:ai_weather/core/helper/screen_size_helper.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/core/utils/strings.dart';
import 'package:ai_weather/core/styles/styles.dart';
import 'package:ai_weather/core/utils/validation.dart';
import 'package:ai_weather/features/auth/presentation/views/widgets/account_check_row.dart';
import 'package:ai_weather/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:ai_weather/features/auth/presentation/views/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isVisible = true;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenSizeHelper = ScreenSizeHelper(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenSizeHelper.verticalPadding,
            horizontal: screenSizeHelper.horizontalPadding),
        child: Form(
          key: formkey,
          child: Column(
            spacing: screenSizeHelper.screenHeight * 0.03,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  AppStrings.login,
                  style: AppStyles.textStyle38.copyWith(color: kPrimaryColor),
                ),
              ),
              CustomTextFormField(
                hintText: AppStrings.hintEmail,
                validator: (value) {
                  return FormValidation.validateEmail(value!);
                },
              ),
              CustomTextFormField(
                validator: (value) {
                  return FormValidation.validatePassword(value!);
                },
                hintText: AppStrings.hintPassword,
                obscureText: isVisible,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                    isVisible == true ? Icons.visibility_off : Icons.visibility,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              SubmitButton(
                  onPressed: () {
                    formkey.currentState!.validate();
                  },
                  buttonName: AppStrings.login),
              AccountCheckRow(
                type: AppStrings.signUp,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
