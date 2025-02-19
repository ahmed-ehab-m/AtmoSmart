class WeatherEntity {
  final double temp;
  final int humidity;
  final String condition;
  final double uv;
  final double rain;

  WeatherEntity(
      {required this.rain,
      required this.uv,
      required this.condition,
      required this.temp,
      required this.humidity});
}
