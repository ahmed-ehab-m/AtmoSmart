class WeatherModel {
  final double temp;
  final String humidity;
  final String condition;
  WeatherModel(
      {required this.condition, required this.temp, required this.humidity});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        temp: json['current']['temp_c'].toDouble(),
        humidity: json['humidity'].toString(),
        condition: json['current']['condition']['text'],
      );
}
