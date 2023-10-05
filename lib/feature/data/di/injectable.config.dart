// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather/feature/data/repos/abstractrepos.dart' as _i3;
import 'package:weather/feature/domain/repos/getuserweatherrepo.dart' as _i4;
import 'package:weather/feature/state/bloc/bloc/getuserweather_bloc.dart'
    as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IGetUserLocationRepo>(() => _i4.GetUserWeatherrepo());
    gh.factory<_i5.GetuserweatherBloc>(
        () => _i5.GetuserweatherBloc(gh<_i3.IGetUserLocationRepo>()));
    return this;
  }
}
