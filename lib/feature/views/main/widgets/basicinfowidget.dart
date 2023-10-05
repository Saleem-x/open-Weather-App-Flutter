import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/constents/styles.dart';
import 'package:weather/feature/data/models/weather_model/weather_model.dart';

class BaseInfoWidget extends StatelessWidget {
  const BaseInfoWidget({
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
              weather.name!,
              textAlign: TextAlign.center,
              style: kprimaryfont(fontSize: 32, color: kwhiteshade),
            ),
            Text(
              DateFormat('dd/MMMM/y').format(DateTime.now()),
              style: kprimaryfont(fontSize: 18, color: kwhiteshade),
            ),
            Text(
              DateFormat('hh:mm a').format(DateTime.now()),
              style: kprimaryfont(fontSize: 18, color: kwhiteshade),
            )
          ],
        ),
      ],
    );
  }
}
