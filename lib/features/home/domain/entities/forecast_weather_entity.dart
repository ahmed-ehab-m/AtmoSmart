import 'package:flutter/material.dart';

class ForecastEntity {
  final String day;
  final double averageTemp;
  final int averageHumidity;
  final double uv;
  final double rainChance;
  final String condition;
  Color? color;

  ForecastEntity({
    this.color,
    required this.day,
    required this.averageTemp,
    required this.averageHumidity,
    required this.uv,
    required this.rainChance,
    required this.condition,
    required String date,
  });
  static List<int> feature(ForecastEntity entity) {
    List<int> features = [];
    //////////Rainy////////////
    entity.rainChance > 0.5 ? features.add(1) : features.add(0);
    ///////////Sunny////////////
    entity.uv > 5 || entity.condition == 'Sunny'
        ? features.add(1)
        : features.add(0);
    /////////////hot/////////////
    entity.averageTemp > 30 ? features.add(1) : features.add(0);
    /////////////mild/////////////
    entity.averageTemp > 20 && entity.averageTemp < 30
        ? features.add(1)
        : features.add(0);
    ///////humditiy////////////////
    entity.averageHumidity > 50 ? features.add(1) : features.add(0);
    return features;
  }
}
