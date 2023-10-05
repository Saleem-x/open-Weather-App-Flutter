import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/core/api/api.dart';
import 'package:weather/core/failures/failures.dart';
import 'package:weather/feature/data/models/weather_model/weather_model.dart';
import 'package:weather/feature/data/repos/abstractrepos.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IGetUserLocationRepo)
class GetUserWeatherrepo implements IGetUserLocationRepo {
  @override
  Future<Either<MainFailures, WeatherModel>> getuserweather() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      log(permission.name);
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation,
          forceAndroidLocationManager: true);
      final response = await http.get(Uri.parse(
          '${domain}lat=${position.latitude}&lon=${position.longitude}&appid=$apikey'));
      log('${domain}lat=${position.latitude}&lon=${position.longitude}&appid=$apikey');
      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body);
        // log(response.body);
        return right(WeatherModel.fromJson(jsonMap));
      } else {
        return left(
            const MainFailures.networkerror(error: 'Something went wrong'));
      }
    } catch (e) {
      log('weather error $e');
      return left(const MainFailures.serverfailure());
    }
  }
}
