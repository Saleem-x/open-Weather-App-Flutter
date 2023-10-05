import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/constents/styles.dart';
import 'package:weather/core/failures/failures.dart';
import 'package:weather/feature/data/repos/abstractrepos.dart';

class WeatherIconRepo implements IGetWeatherIcon {
  @override
  Future<Either<MainFailures, Icon>> getuserweathericon(String iconCode) async {
    try {
      switch (iconCode) {
        case '01d':
          return right(const Icon(
            Icons.wb_sunny,
            size: 100,
            color: kcolorwhite,
          ));
        case '02d':
          return right(const Icon(
            Icons.wb_cloudy,
            size: 100,
            color: kcolorwhite,
          ));
        case '03d':
        case '03n':
        case '04d':
        case '04n':
          return right(const Icon(
            Icons.cloud,
            size: 100,
            color: kcolorwhite,
          ));
        case '09d':
        case '09n':
        case '10d':
        case '10n':
          return right(const Icon(
            Icons.wb_cloudy,
            size: 100,
            color: kcolorwhite,
          ));
        case '11d':
        case '11n':
          return right(const Icon(
            Icons.flash_on,
            size: 100,
            color: kcolorwhite,
          ));

        case '13d':
        case '13n':
          return right(const Icon(
            Icons.ac_unit,
            size: 100,
            color: kcolorwhite,
          ));

        case '50d':
        case '50n':
          return right(const Icon(
            Icons.filter_drama,
            size: 100,
            color: kcolorwhite,
          ));
        default:
          return right(const Icon(
            Icons.error,
            size: 100,
            color: kcolorwhite,
          ));
      }
    } catch (e) {
      return left(const MainFailures.serverfailure());
    }
  }
}
