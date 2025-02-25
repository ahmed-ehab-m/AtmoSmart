import 'package:ai_weather/features/home/domain/entities/forecast_weather_entity.dart';

class WeatherEntity {
  final double temp;
  final int humidity;
  final String condition;
  final double uv;
  final double rain;
  final String location;
  final List<ForecastEntity> forecast;

  WeatherEntity(
      {required this.forecast,
      required this.location,
      required this.rain,
      required this.uv,
      required this.condition,
      required this.temp,
      required this.humidity});

  static List<int> feature(WeatherEntity entity) {
    List<int> features = [];
    //////////Rainy////////////
    entity.forecast[0].rainChance > 0.5 ? features.add(1) : features.add(0);
    ///////////Sunny////////////
    entity.forecast[0].uv > 5 || entity.forecast[0].condition == 'Sunny'
        ? features.add(1)
        : features.add(0);
    /////////////hot/////////////
    entity.forecast[0].averageTemp > 30 ? features.add(1) : features.add(0);
    /////////////mild/////////////
    entity.forecast[0].averageTemp > 20 && entity.forecast[0].averageTemp < 30
        ? features.add(1)
        : features.add(0);
    ///////humditiy////////////////
    entity.forecast[0].averageHumidity > 50 ? features.add(1) : features.add(0);
    return features;
  }
}
