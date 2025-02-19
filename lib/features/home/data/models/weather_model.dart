import 'package:ai_weather/features/home/domain/entities/weather_entity.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  final double temp;
  final int humidity;
  final String condition;
  final double uv;
  final double rain;
  WeatherModel(
      {required this.uv,
      required this.condition,
      required this.temp,
      required this.humidity,
      required this.rain});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        temp: json['current']['temp_c'].toDouble(),
        humidity: json['current']['humidity'],
        condition: json['current']['condition']['text'],
        uv: json['current']['uv'],
        rain: json['current']['precip_mm'],
      );

  WeatherEntity toEntity() {
    return WeatherEntity(
      rain: rain,
      temp: temp,
      humidity: humidity,
      condition: condition,
      uv: uv,
    );
  }
}
