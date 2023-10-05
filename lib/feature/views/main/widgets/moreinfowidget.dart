import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/constents/styles.dart';
import 'package:weather/feature/data/models/weather_model/weather_model.dart';

class MoreInfoWidget extends StatelessWidget {
  const MoreInfoWidget({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.sunny,
              color: kwhiteshade,
            ),
            Text(
              'sunrise',
              style: kprimaryfont(fontSize: 13, color: kwhiteshade),
            ),
            Text(
                DateFormat('hh:mm a').format(
                  DateTime.fromMillisecondsSinceEpoch(
                      weather.sys!.sunrise! * 1000,
                      isUtc: false),
                ),
                style: kprimaryfont(fontSize: 17, color: kwhiteshade))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Iconsax.wind,
              color: kwhiteshade,
            ),
            Text(
              'Wind',
              style: kprimaryfont(fontSize: 13, color: kwhiteshade),
            ),
            Text("${weather.wind!.speed! * 3.6.round()}km/h",
                style: kprimaryfont(fontSize: 17, color: kwhiteshade))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              FontAwesomeIcons.droplet,
              color: kwhiteshade,
            ),
            Text(
              'Humidity',
              style: kprimaryfont(fontSize: 13, color: kwhiteshade),
            ),
            Text('${weather.main!.humidity!}%',
                style: kprimaryfont(fontSize: 17, color: kwhiteshade))
          ],
        )
      ],
    );
  }
}
