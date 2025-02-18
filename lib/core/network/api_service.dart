import 'package:ai_weather/features/home/data/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherApiService {
  final Dio dio;
  WeatherApiService({required this.dio});
  final String apiKey = 'b349537498bf45eb92d174825251702';
  // final String city = 'Egypt';
  // final String endpoint = 'current';
  final String baseUrl = 'https://api.weatherapi.com/v1/';
  // Future<WeatherModel> getWeather(
  //     {String? days,
  //     String? hour,
  //     required String city,
  //     required String endpoint}) async {
  //   Response response =
  //       await dio.get('$baseUrl/$endpoint.json?q=$city&key=$apiKey');
  //   Response response2 = await dio
  //       .get('$baseUrl/$endpoint.json?q=$city&days=3&hour=24&key=$apiKey');
  //   WeatherModel weatherModel = WeatherModel.fromJson(response.data);
  //   return weatherModel;
  // }

  Future<WeatherModel> getWeather({required String url}) async {
    Response response = await dio.get(url);
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }
}
