part of 'getuserweather_bloc.dart';

@freezed
class GetuserweatherState with _$GetuserweatherState {
  const factory GetuserweatherState.inittialweather(
      {required WeatherModel? weather}) = Inittialweather;

  const factory GetuserweatherState.failurestate() = Failurestate;

  factory GetuserweatherState.initial() =>
      const GetuserweatherState.inittialweather(weather: null);
}
