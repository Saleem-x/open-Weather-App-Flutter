part of 'getuserweather_bloc.dart';

@freezed
class GetuserweatherEvent with _$GetuserweatherEvent {
  const factory GetuserweatherEvent.getinitialweather() = Getinitialweather;

  const factory GetuserweatherEvent.searchCity({required String city}) =
      SearchCityEvent;
}
