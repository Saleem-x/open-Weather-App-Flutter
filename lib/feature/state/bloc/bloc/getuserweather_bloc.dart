import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/core/failures/failures.dart';
import 'package:weather/feature/data/models/weather_model/weather_model.dart';
import 'package:weather/feature/data/repos/abstractrepos.dart';

part 'getuserweather_event.dart';
part 'getuserweather_state.dart';
part 'getuserweather_bloc.freezed.dart';

@injectable
class GetuserweatherBloc
    extends Bloc<GetuserweatherEvent, GetuserweatherState> {
  final IGetUserLocationRepo weatherrepo;
  GetuserweatherBloc(this.weatherrepo) : super(GetuserweatherState.initial()) {
    on<Getinitialweather>((event, emit) async {
      Either<MainFailures, WeatherModel> getweather =
          await weatherrepo.getuserweather();

      emit(getweather.fold((l) => const GetuserweatherState.failurestate(),
          (r) => Inittialweather(weather: r)));
    });
  }
}
