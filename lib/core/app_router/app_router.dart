import 'package:ai_weather/features/auth/presentation/views/login_view.dart';
import 'package:ai_weather/features/auth/presentation/views/signup_view.dart';
import 'package:ai_weather/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String login = '/login';
  static const String home = '/home';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
