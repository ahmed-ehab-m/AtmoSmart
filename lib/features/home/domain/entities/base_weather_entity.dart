class BaseWeatherEntity {
  final dynamic temp;
  final dynamic humidity;
  final String condition;
  final dynamic uv;
  final dynamic rain;

  BaseWeatherEntity({
    required this.temp,
    required this.humidity,
    required this.condition,
    required this.uv,
    required this.rain,
  });
}
