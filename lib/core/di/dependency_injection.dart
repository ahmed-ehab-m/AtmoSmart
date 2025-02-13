import 'package:ai_weather/core/helper/cache_helper.dart';
import 'package:ai_weather/features/auth/data/data_resources/auth_remote_datasource.dart';
import 'package:ai_weather/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ai_weather/features/auth/domain/repo_interface/auth_repositry.dart';
import 'package:ai_weather/features/auth/domain/usecases/login_usecase.dart';
import 'package:ai_weather/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ai_weather/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

////for managing dependencies//////////
final sl = GetIt.instance;

Future<void> setupLocator() async {
  // 1. تسجيل SharedPreferences
  sl.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());

  await sl.isReady<SharedPreferences>();

  // 2. تسجيل SharedPrefsHelper
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper(sl()));

  // 3. تسجيل FirebaseAuth
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // 4. تسجيل AuthRemoteDatasource مع حقن الـ SharedPrefsHelper
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(
        sl(), sl()), // sl() هنا تشير إلى FirebaseAuth و SharedPrefsHelper
  );

  /// 5️⃣ AuthRepository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      sl(),
    ), // sl() هنا تشير إلى الـ DataSources
  );

  /// 6️⃣ Use Cases
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecaseImpl(sl()));
  sl.registerLazySingleton<SignUpUseCase>(() => SignupUsecaseImpl(sl()));

  /// 7️⃣ AuthCubit
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl(), sl()));
}
