import 'package:ai_weather/features/home/domain/entities/forecast_weather_entity.dart';

class ForecastWeatherModel {
  final double temp;
  final int humidity;
  final String condition;
  final double uv;
  final int rain;
  final String date;

  ForecastWeatherModel(
      {required this.temp,
      required this.humidity,
      required this.condition,
      required this.uv,
      required this.rain,
      required this.date});

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) =>
      ForecastWeatherModel(
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'].toDouble(),
        humidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
        condition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        uv: json['forecast']['forecastday'][0]['day']['uv'],
        rain: json['forecast']['forecastday'][0]['day']['daily_chance_of_rain'],
        date: json['forecast']['forecastday'][0]['date'],
      );

  ForecastWeatherEntity toEntity() {
    return ForecastWeatherEntity(
        rain: rain,
        temp: temp,
        humidity: humidity,
        condition: condition,
        uv: uv,
        date: date);
  }
}
