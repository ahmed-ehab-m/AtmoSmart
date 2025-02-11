import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/auth/domain/entities/userEntity.dart';
import 'package:ai_weather/features/auth/domain/repo_interface/auth_repositry.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpUseCase {
  Future<Either<Failure, UserEntity>> execute(String email, String password);
}

class SignupUsecaseImpl implements SignUpUseCase {
  final AuthRepository authRepository;
  SignupUsecaseImpl(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> execute(String email, String password) {
    return authRepository.signUp(email, password);
  }
}
