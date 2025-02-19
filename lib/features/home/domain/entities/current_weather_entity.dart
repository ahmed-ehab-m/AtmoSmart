import 'package:flutter/material.dart';

class CurrentWeatherEntity {
  final double temp;
  final int humidity;
  final String condition;
  final double uv;
  final double rain;
  final String location;
  Color? color;

  CurrentWeatherEntity(
      {this.color,
      required this.location,
      required this.rain,
      required this.uv,
      required this.condition,
      required this.temp,
      required this.humidity});
}
