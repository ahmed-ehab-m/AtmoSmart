import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/auth/data/data_resources/auth_remote_datasource.dart';
import 'package:ai_weather/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather/features/auth/domain/repo_interface/auth_repositry.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDataSource;
  AuthRepositoryImpl(
    this.authRemoteDataSource,
  );
  @override
  Future<Either<Failure, UserEntity>> logIn(
      String email, String password) async {
    try {
      final userModel = await authRemoteDataSource.logIn(email, password);
      return Right(userModel!.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(
      String email, String password, String name) async {
    try {
      final userModel =
          await authRemoteDataSource.signUp(email, password, name);
      return Right(userModel!.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
