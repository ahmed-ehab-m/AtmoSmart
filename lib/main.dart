import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:ai_weather/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
