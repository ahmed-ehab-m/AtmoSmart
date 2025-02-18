import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/network/api_service.dart';
import 'package:ai_weather/features/home/data/models/weather_model.dart';
import 'package:dio/dio.dart';

class RemoteDataResource {
  final WeatherApiService weatherApiService;
  RemoteDataResource({required this.weatherApiService});
  final String apiKey = 'b349537498bf45eb92d174825251702';
  final String baseUrl = 'https://api.weatherapi.com/v1/';
  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      WeatherModel weatherModel = await weatherApiService.getWeather(
          url: '$baseUrl/current.json?q=$city&key=$apiKey');
      return weatherModel;
    } on DioException catch (e) {
      throw ServerException(e.toString());
      // TODO
    }
  }

  /////////////////
  Future<WeatherModel> getForecastWeather({required String city}) async {
    try {
      WeatherModel weatherModel = await weatherApiService.getWeather(
          url: '$baseUrl/current.json?q=$city&days=3&hour=24&key=$apiKey');
      return weatherModel;
    } on DioException catch (e) {
      throw ServerException(e.toString());
      // TODO
    }
  }
}
