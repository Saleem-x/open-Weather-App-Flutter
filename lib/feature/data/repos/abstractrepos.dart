import 'package:flutter/material.dart';
import 'package:weather/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:weather/feature/data/models/weather_model/weather_model.dart';

abstract class IGetUserLocationRepo {
  Future<Either<MainFailures, WeatherModel>> getuserweather();
}

abstract class IGetWeatherIcon {
  Future<Either<MainFailures, Icon>> getuserweathericon(String iconCode);
}
