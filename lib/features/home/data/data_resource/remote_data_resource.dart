import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/network/api_service.dart';
import 'package:ai_weather/features/home/data/models/current_weather_model.dart';
import 'package:ai_weather/features/home/data/models/forecast_weather_model.dart';
import 'package:dio/dio.dart';

class RemoteDataResource {
  final WeatherApiService weatherApiService;
  RemoteDataResource(this.weatherApiService);
  final String apiKey = 'b349537498bf45eb92d174825251702';
  final String baseUrl = 'https://api.weatherapi.com/v1/';
  Future<CurrentWeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response = await weatherApiService.getWeather(
          url: '$baseUrl/current.json?q=$city&key=$apiKey');
      CurrentWeatherModel weatherModel =
          CurrentWeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      throw ServerException(e.toString());
      // TODO
    }
  }

  /////////////////
  Future<ForecastWeatherModel> getForecastWeather(
      {required String city}) async {
    try {
      Response response = await weatherApiService.getWeather(
          url: '$baseUrl/forecast.json?q=$city&days=3&hour=24&key=$apiKey');
      ForecastWeatherModel weatherModel =
          ForecastWeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      throw ServerException(e.toString());
      // TODO
    }
  }
}
