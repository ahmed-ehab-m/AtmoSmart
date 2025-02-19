import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/home/domain/entities/weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepositry {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(
      {required String city});
  Future<Either<Failure, WeatherEntity>> getForecastWeather(
      {required String city});
}
