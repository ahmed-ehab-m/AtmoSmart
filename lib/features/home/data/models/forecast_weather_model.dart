import 'package:ai_weather/features/home/domain/entities/base_weather_entity.dart';
import 'package:ai_weather/features/home/domain/entities/forecast_weather_entity.dart';

class ForecastWeatherModel extends BaseWeatherEntity {
  final String date;

  ForecastWeatherModel(
      {required this.date,
      required super.temp,
      required super.humidity,
      required super.condition,
      required super.uv,
      required super.rain});

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) =>
      ForecastWeatherModel(
        temp: json['day']['avgtemp_c'].toDouble(),
        humidity: json['day']['avghumidity'],
        condition: json['day']['condition']['text'],
        uv: json['day']['uv'],
        rain: json['day']['daily_chance_of_rain'],
        date: json['date'],
      );

  ForecastEntity toEntity() {
    return ForecastEntity(
        rain: rain,
        condition: condition,
        uv: uv,
        date: date,
        day: date,
        temp: temp.toDouble(),
        humidity: humidity);
  }
}
