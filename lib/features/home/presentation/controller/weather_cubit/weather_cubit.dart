import 'package:ai_weather/features/home/domain/entities/weather_entity.dart';
import 'package:ai_weather/features/home/domain/use_cases/get_current_weather_usecase.dart';
import 'package:ai_weather/features/home/domain/use_cases/get_forecase_weather_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.getCurrentWeatherUseCase, this.getForecaseWeatherUseCase)
      : super(GetWeatherInitial());
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetForecastWeatherUseCase getForecaseWeatherUseCase;

  Future<WeatherEntity?>? getCurrentWeather(String city) async {
    emit(GetWeatherLoading());
    final failureOrWeather = await getCurrentWeatherUseCase(city: city);
    failureOrWeather.fold(
        (failure) => emit(GetWeatherFailure(message: failure.message)),
        (weather) => emit(GetWeatherSuccess(weatherEntity: weather)));
  }

  /////////////////////////
  Future<WeatherEntity?>? getForeCastWeather(String city) async {
    emit(GetWeatherLoading());
    final failureOrWeather = await getForecaseWeatherUseCase(city: city);
    failureOrWeather.fold(
        (failure) => emit(GetWeatherFailure(message: failure.message)),
        (weather) => emit(GetWeatherSuccess(weatherEntity: weather)));
  }
}
