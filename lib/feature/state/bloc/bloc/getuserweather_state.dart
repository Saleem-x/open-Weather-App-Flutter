part of 'getuserweather_bloc.dart';

@freezed
class GetuserweatherState with _$GetuserweatherState {
  const factory GetuserweatherState.inittialweather(
      {required WeatherModel? weather}) = Inittialweather;

  const factory GetuserweatherState.failurestate() = Failurestate;

  const factory GetuserweatherState.searchfoundstate(
      {required WeatherModel? weather}) = Searchfoundstate;
  const factory GetuserweatherState.searchnotfoundState() = SearchnotfoundState;

  factory GetuserweatherState.initial() =>
      const GetuserweatherState.inittialweather(weather: null);
}
