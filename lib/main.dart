import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AIWeather());
}

class AIWeather extends StatelessWidget {
  const AIWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   scaffoldBackgroundColor: kPrimaryColor,
      //   brightness: Brightness.dark,
      // ),
      routerConfig: AppRouter.router,
    );
  }
}
