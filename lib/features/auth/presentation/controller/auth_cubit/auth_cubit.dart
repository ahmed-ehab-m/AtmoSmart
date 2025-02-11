import 'package:ai_weather/features/auth/domain/entities/userEntity.dart';
import 'package:ai_weather/features/auth/domain/usecases/login_usecase.dart';
import 'package:ai_weather/features/auth/domain/usecases/signup_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUsecase, this.signUpUseCase) : super(AuthInitial());
  final LoginUsecase loginUsecase;
  final SignUpUseCase signUpUseCase;
  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    final result = await signUpUseCase.execute(email, password);
    result.fold(
      (failure) => emit(
        AuthFailure(message: failure.message),
      ),
      (user) => emit(
        AuthSuccess(userEntity: user),
      ),
    );
  }

  Future<void> logIn(String email, String password) async {
    emit(AuthLoading());
    final result = await loginUsecase.execute(email, password);
    result.fold(
      (failure) => emit(
        AuthFailure(message: failure.message),
      ),
      (user) => emit(
        AuthSuccess(userEntity: user),
      ),
    );
  }
}
