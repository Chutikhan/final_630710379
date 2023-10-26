
import 'package:flutter/material.dart';
import 'package:final_630710379/models/weather.dart';


class HomePage extends StatefulWidget {
  final String jsonData = '''
    {
      "city": "Bangkok",
      "country": "Thailand",
      "lastUpdated": "2023-10-26 09:00",
      "tempC": 29,
      "tempF": 84.2,
      "feelsLikeC": 34.7,
      "feelsLikeF": 94.4,
      "windKph": 13,
      "windMph": 8.1,
      "humidity": 84,
      "uv": 6,
      "condition": {
        "text": "Partly cloudy",
        "icon": "https://cdn.weatherapi.com/weather/128x128/day/116.png"
      }
    }
  ''';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherData weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = parseWeatherData(widget.jsonData);
  }

  bool isCelsius = true;
  double currentTemp = 0.0;
  double currentFeelsLike = 0.0;

  void toggleTemperatureUnit() {
    setState(() {
      isCelsius = !isCelsius;
      if (isCelsius) {
        currentTemp = weatherData.tempC;
        currentFeelsLike = weatherData.feelsLikeC;
      } else {
        currentTemp = weatherData.tempF;
        currentFeelsLike = weatherData.feelsLikeF;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${weatherData.city}, ${weatherData.country}',
              style: TextStyle(fontSize: 24),
            ),
            Image.network(weatherData.condition.icon, width: 100, height: 100),
            Text(' ${weatherData.condition.text}',style: TextStyle(fontSize: 22),),
            Text(
              '${currentTemp.toStringAsFixed(1)}${isCelsius ? '°C' : '°F'}',
              style: TextStyle(fontSize: 50),
            ),

            Text('Feels Like: ${currentFeelsLike.toStringAsFixed(1)}${isCelsius ? '°C' : '°F'}'),
            Text('Wind: ${isCelsius ? weatherData.windKph : weatherData.windMph} ${isCelsius ? 'km/h' : 'mph'}'),
            Text('Humidity: ${weatherData.humidity}%'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.wb_sunny,
                  color: Colors.amber,
                  size: 24,
                ),
                Text('UV : ${weatherData.uv}'),
              ],
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isCelsius = true;
                      currentTemp = weatherData.tempC;
                      currentFeelsLike = weatherData.feelsLikeC;
                    });
                  },
                  child: Text('°C'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isCelsius = false;
                      currentTemp = weatherData.tempF;
                      currentFeelsLike = weatherData.feelsLikeF;
                    });
                  },
                  child: Text('°F'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



