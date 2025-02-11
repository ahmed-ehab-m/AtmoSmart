import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/auth/domain/entities/userEntity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositry {
  Future<Either<Failure, UserEntity>> signUp(String email, String password);
  Future<Either<Failure, UserEntity>> logIn(String email, String password);
}
