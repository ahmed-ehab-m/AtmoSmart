import 'package:ai_weather/features/auth/data/data_resources/auth_remote_datasource.dart';
import 'package:ai_weather/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ai_weather/features/auth/domain/repo_interface/auth_repositry.dart';
import 'package:ai_weather/features/auth/domain/usecases/login_usecase.dart';
import 'package:ai_weather/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ai_weather/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

////for managing dependencies//////////
final sl = GetIt.instance;

void setupLocator() {
  ///for firebase auth/////////////////////////////
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasource(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecaseImpl(sl()));
  sl.registerLazySingleton<SignUpUseCase>(() => SignupUsecaseImpl(sl()));
  sl.registerFactory(() => AuthCubit(sl(), sl()));
}
