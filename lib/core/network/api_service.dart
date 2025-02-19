import 'package:ai_weather/features/home/data/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherApiService {
  final Dio dio;
  WeatherApiService(this.dio);
  Future<WeatherModel> getWeather({required String url}) async {
    Response response = await dio.get(url);
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }
}
