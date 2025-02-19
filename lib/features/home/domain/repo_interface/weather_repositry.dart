import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/home/domain/entities/current_weather_entity.dart';
import 'package:ai_weather/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepositry {
  Future<Either<Failure, CurrentWeatherEntity>> getCurrentWeather(
      {required String city});
  Future<Either<Failure, ForecastWeatherEntity>> getForecastWeather(
      {required String city});
}
