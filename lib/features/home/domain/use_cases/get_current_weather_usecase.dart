import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/home/domain/entities/current_weather_entity.dart';
import 'package:ai_weather/features/home/domain/repo_interface/weather_repositry.dart';
import 'package:dartz/dartz.dart';

abstract class GetCurrentWeatherUseCase {
  Future<Either<Failure, CurrentWeatherEntity>> call({required String city});
}

class GetCurrentWeatherUseCaseImpl implements GetCurrentWeatherUseCase {
  final WeatherRepositry weatherRepositry;
  GetCurrentWeatherUseCaseImpl(this.weatherRepositry);
  @override
  Future<Either<Failure, CurrentWeatherEntity>> call({required String city}) {
    return weatherRepositry.getCurrentWeather(city: city);
  }
}
