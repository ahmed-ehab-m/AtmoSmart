import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/home/domain/entities/weather_entity.dart';
import 'package:ai_weather/features/home/domain/repo_interface/weather_repositry.dart';
import 'package:dartz/dartz.dart';

abstract class GetForecastWeatherUseCase {
  Future<Either<Failure, WeatherEntity>> call({required String city});
}

class GetForecastWeatherUseCaseImpl implements GetForecastWeatherUseCase {
  final WeatherRepositry weatherRepositry;
  GetForecastWeatherUseCaseImpl(this.weatherRepositry);
  @override
  Future<Either<Failure, WeatherEntity>> call({required String city}) async {
    return await weatherRepositry.getForecastWeather(city: city);
  }
}
