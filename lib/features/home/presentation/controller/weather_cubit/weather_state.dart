part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class GetWeatherInitial extends WeatherState {}

final class GetWeatherLoading extends WeatherState {}

final class GetWeatherSuccess extends WeatherState {
  final WeatherEntity weatherEntity;
  GetWeatherSuccess({required this.weatherEntity});
}

final class GetWeatherFailure extends WeatherState {
  final String message;
  GetWeatherFailure({required this.message});
}
