import 'package:ai_weather/features/home/domain/entities/current_weather_entity.dart';

class CurrentWeatherModel {
  final double temp;
  final int humidity;
  final String condition;
  final double uv;
  final double rain;
  final String location;
  // final String? date;
  // final double? averageTemp;
  // final int? averageHumidity;
  // final String? dayCondition;
  // final double? dayUv;
  // final int? dayRain;
  CurrentWeatherModel({
    required this.location,
    required this.uv,
    required this.condition,
    required this.temp,
    required this.humidity,
    required this.rain,
    // this.date,
    // this.averageTemp,
    // this.averageHumidity,
    // this.dayCondition,
    // this.dayUv,
    // this.dayRain
  });

  factory CurrentWeatherModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      CurrentWeatherModel(
        temp: json['current']['temp_c'].toDouble(),
        humidity: json['current']['humidity'],
        condition: json['current']['condition']['text'],
        uv: json['current']['uv'],
        rain: json['current']['precip_mm'],
        location: json['location']['region'],
        // averageTemp:
        //     json['forecast']['forecastday'][index]['day']['avgtemp_c'].toDouble(),
        // averageHumidity: json['forecast']['forecastday'][index]['day']
        //     ['avghumidity'],
        // dayCondition: json['forecast']['forecastday'][0]['condition'],
        // dayUv: json['forecast']['forecastday'][0]['day']['uv'],
        // dayRain: json['forecast']['forecastday'][0]['day']
        //     ['daily_chance_of_rain'],
        // date: json['forecast']['forecastday'][0]['date'],
      );

  CurrentWeatherEntity toEntity() {
    return CurrentWeatherEntity(
        rain: rain,
        temp: temp,
        humidity: humidity,
        condition: condition,
        uv: uv,
        location: location);
  }
}
