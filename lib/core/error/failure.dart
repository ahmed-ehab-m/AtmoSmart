import 'package:ai_weather/core/utils/strings.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure([super.message = AppStrings.serverFailure]);
}

class CacheFailure extends Failure {
  CacheFailure([super.message = AppStrings.cacheFailure]);
}
