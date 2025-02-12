import 'package:ai_weather/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather/features/auth/domain/usecases/login_usecase.dart';
import 'package:ai_weather/features/auth/domain/usecases/signup_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUsecase, this.signUpUseCase) : super(AuthInitial());
  final LoginUsecase loginUsecase;
  final SignUpUseCase signUpUseCase;
  Future<void> signUp(String email, String password, String name) async {
    emit(SignUpLoading());
    final result = await signUpUseCase.execute(email, password, name);
    result.fold(
      (failure) => emit(
        SignUpFailure(message: failure.message),
      ),
      (user) => emit(
        SignUpSuccess(userEntity: user),
      ),
    );
  }

  Future<void> logIn(String email, String password) async {
    emit(LoginLoading());
    final result = await loginUsecase.execute(email, password);
    result.fold(
      (failure) => emit(
        LoginFailure(message: failure.message),
      ),
      (user) => emit(
        LoginSuccess(userEntity: user),
      ),
    );
  }
}
