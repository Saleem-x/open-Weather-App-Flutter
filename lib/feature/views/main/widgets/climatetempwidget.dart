import 'package:flutter/material.dart';
import 'package:weather/core/constents/styles.dart';
import 'package:weather/feature/data/models/weather_model/weather_model.dart';

class ClimateandTemp extends StatelessWidget {
  const ClimateandTemp({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              '${weather.main!.temp!.toInt() - 271}°C',
              textAlign: TextAlign.center,
              style: kprimaryfont(fontSize: 32, color: kwhiteshade),
            ),
            Text(
              weather.weather![0].description!,
              textAlign: TextAlign.center,
              style: kprimaryfont(fontSize: 17, color: kwhiteshade),
            ),
            Text(
              DateTime.now().hour >= 5 && DateTime.now().hour < 12
                  ? 'Good Morning'
                  : DateTime.now().hour >= 12 && DateTime.now().hour < 17
                      ? 'Good Afternoon'
                      : DateTime.now().hour >= 17 && DateTime.now().hour < 21
                          ? 'Good Evening'
                          : 'Good Night',
              style: kprimaryfont(fontSize: 18, color: kwhiteshade),
            ),
          ],
        ),
      ],
    );
  }
}
