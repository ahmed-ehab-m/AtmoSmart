import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/network/api_service.dart';
import 'package:ai_weather/core/utils/strings.dart';
import 'package:ai_weather/features/home/data/models/current_weather_model.dart';
import 'package:dio/dio.dart';

class RemoteDataResource {
  final WeatherApiService weatherApiService;
  RemoteDataResource(this.weatherApiService);
  final String apiKey = 'b349537498bf45eb92d174825251702';
  final String baseUrl = 'https://api.weatherapi.com/v1/';
  final String flaskApiUrl = 'http://10.0.2.2:5001/predict';
  Future<Map<String, dynamic>> getPredictions(
      {required List<int> features}) async {
    try {
      final url = Uri.parse(flaskApiUrl).toString();
      Map<String, dynamic> body = {'features': features};
      final response = await Dio().post(url, data: body);
      print('remote data source  response is $response');
      print(response.data);

      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<WeatherModel> getWeather({required String location}) async {
    try {
      Response response = await weatherApiService.getWeather(
          url: '$baseUrl/forecast.json?q=$location&days=4&hour=24&key=$apiKey');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          return ServerException(AppStrings.badRequestMessage);
        case 401:
        case 403:
          return ServerException(AppStrings.unauthorizedAccessMessage);
        case 404:
          return ServerException(AppStrings.locationNotFoundMessage);
        case 500:
          return ServerException(AppStrings.serverErrorMessage);
        default:
          return ServerException('Unknown error: ${e.response!.statusCode}');
      }
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return ServerException(AppStrings.connectionTimeoutMessage);
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return ServerException(AppStrings.receiveTimeoutMessage);
    } else if (e.type == DioExceptionType.cancel) {
      return ServerException(AppStrings.requestCancelledMessage);
    } else {
      return ServerException(AppStrings.unexpectedErrorMessage);
    }
  }
}
