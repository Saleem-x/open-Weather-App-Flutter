import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/feature/data/di/injectable.config.dart';

final getit = GetIt.instance;

@InjectableInit()
Future<void> configureinjection() async {
  getit.init(environment: Environment.prod);
  log('getit');
}
