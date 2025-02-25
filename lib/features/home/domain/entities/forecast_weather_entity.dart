import 'package:ai_weather/features/home/domain/entities/base_weather_entity.dart';
import 'package:flutter/material.dart';

class ForecastEntity extends BaseWeatherEntity {
  final String day;

  Color? color;

  ForecastEntity({
    this.color,
    required this.day,
    required String date,
    required super.temp,
    required super.humidity,
    required super.rain,
    required super.condition,
    required super.uv,
  });
  static List<int> feature(ForecastEntity entity) {
    List<int> features = [];
    //////////Rainy////////////
    entity.rain > 0.5 ? features.add(1) : features.add(0);
    ///////////Sunny////////////
    entity.uv > 5 || entity.condition == 'Sunny'
        ? features.add(1)
        : features.add(0);
    /////////////hot/////////////
    entity.temp > 30 ? features.add(1) : features.add(0);
    /////////////mild/////////////
    entity.temp > 20 && entity.temp < 30 ? features.add(1) : features.add(0);
    ///////humditiy////////////////
    entity.humidity > 50 ? features.add(1) : features.add(0);
    return features;
  }
}
