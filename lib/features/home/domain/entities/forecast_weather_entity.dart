class ForecastWeatherEntity {
  final double temp;
  final int humidity;
  final String condition;
  final double uv;
  final int rain;
  final String date;

  ForecastWeatherEntity(
      {required this.temp,
      required this.humidity,
      required this.condition,
      required this.uv,
      required this.rain,
      required this.date});
}
