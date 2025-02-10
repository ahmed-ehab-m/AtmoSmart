import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:ai_weather/core/helper/screen_size_helper.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/core/utils/strings.dart';
import 'package:ai_weather/core/utils/styles.dart';
import 'package:ai_weather/core/utils/validation.dart';
import 'package:ai_weather/features/auth/presentation/widgets/account_check_row.dart';
import 'package:ai_weather/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:ai_weather/features/auth/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
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
                  AppStrings.signUp,
                  style: AppStyles.textStyle38.copyWith(color: kPrimaryColor),
                ),
              ),
              CustomTextFormField(
                hintText: AppStrings.hintName,
                validator: (value) {
                  return FormValidation.validateName(value!);
                },
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
                  buttonName: AppStrings.signUp),
              AccountCheckRow(
                type: AppStrings.login,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
