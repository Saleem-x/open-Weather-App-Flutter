import 'package:flutter/material.dart';
import 'package:weather/feature/data/models/weather_model/weather_model.dart';
import 'package:weather/feature/views/widgets/weathericon.dart';

class WeatherIconWidget extends StatelessWidget {
  const WeatherIconWidget({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(),
      child: getWeatherIcon(weather.weather![0].icon!),
    );
  }
}
