
import 'dart:convert';

class WeatherData {
  final String city;
  final String country;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windKph;
  final double windMph;
  final int humidity;
  final int uv;
  final WeatherCondition condition;

  WeatherData({
    required this.city,
    required this.country,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.uv,
    required this.condition,
  });

  static fromJson(jsonData) {}
}

class WeatherCondition {
  final String text;
  final String icon;

  WeatherCondition({
    required this.text,
    required this.icon,
  });
}
WeatherData parseWeatherData(String jsonString) {
  final Map<String, dynamic> jsonData = json.decode(jsonString);
  final Map<String, dynamic> conditionData = jsonData['condition'];

  return WeatherData(
    city: jsonData['city'],
    country: jsonData['country'],
    lastUpdated: jsonData['lastUpdated'],
    tempC: jsonData['tempC'].toDouble(),
    tempF: jsonData['tempF'].toDouble(),
    feelsLikeC: jsonData['feelsLikeC'].toDouble(),
    feelsLikeF: jsonData['feelsLikeF'].toDouble(),
    windKph: jsonData['windKph'].toDouble(),
    windMph: jsonData['windMph'].toDouble(),
    humidity: jsonData['humidity'],
    uv: jsonData['uv'],
    condition: WeatherCondition(
      text: conditionData['text'],
      icon: conditionData['icon'],
    ),
  );
}


