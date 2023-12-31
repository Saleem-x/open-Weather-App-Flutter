import 'package:flutter/material.dart';
import 'package:weather/core/constents/styles.dart';

Icon getWeatherIcon(String iconCode) {
  switch (iconCode) {
    case '01d':
      return const Icon(
        Icons.wb_sunny,
        size: 100,
        color: kcolorwhite,
      );
    case '02d':
      return const Icon(Icons.wb_cloudy);
    case '03d':
    case '03n':
    case '04d':
    case '04n':
      return const Icon(
        Icons.cloud,
        size: 100,
        color: kcolorwhite,
      );
    case '09d':
    case '09n':
    case '10d':
    case '10n':
      return const Icon(
        Icons.wb_cloudy,
        size: 100,
        color: kcolorwhite,
      );
    case '11d':
    case '11n':
      return const Icon(
        Icons.flash_on,
        size: 100,
        color: kcolorwhite,
      );
    case '13d':
    case '13n':
      return const Icon(
        Icons.ac_unit,
        size: 100,
        color: kcolorwhite,
      );
    case '50d':
    case '50n':
      return const Icon(
        Icons.filter_drama,
        size: 100,
        color: kcolorwhite,
      );
    default:
      return const Icon(
        Icons.error,
        size: 100,
        color: kcolorwhite,
      );
  }
}
