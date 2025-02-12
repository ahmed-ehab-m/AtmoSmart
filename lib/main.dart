import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:ai_weather/core/di/dependency_injection.dart';
import 'package:ai_weather/features/auth/data/data_resources/auth_local_datasource.dart';
import 'package:ai_weather/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:ai_weather/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();

  runApp(const AIWeather());
}

class AIWeather extends StatelessWidget {
  const AIWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
