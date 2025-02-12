import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signUp(
      String email, String password, String name);
  Future<Either<Failure, UserEntity>> logIn(String email, String password);
}
