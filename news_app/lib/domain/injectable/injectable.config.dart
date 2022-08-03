// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/newses/all/all_bloc.dart' as _i9;
import '../../application/newses/business/business_news_bloc.dart' as _i10;
import '../../application/newses/entertainment/entertainment_bloc.dart' as _i11;
import '../../application/newses/genaral/general_bloc.dart' as _i12;
import '../../application/newses/health/health_bloc.dart' as _i13;
import '../../application/newses/science/science_bloc.dart' as _i5;
import '../../application/newses/sports/sports_bloc.dart' as _i6;
import '../../application/newses/technology/tecknology_bloc.dart' as _i7;
import '../../application/newses/top/top_bloc.dart' as _i8;
import '../../infrastrucutre/service/news_repo.dart' as _i3;
import '../../infrastrucutre/service/news_service.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.NewsRepo>(() => _i4.NewsServieces());
  gh.factory<_i5.ScienceBloc>(() => _i5.ScienceBloc(get<_i3.NewsRepo>()));
  gh.factory<_i6.SportsBloc>(() => _i6.SportsBloc(get<_i3.NewsRepo>()));
  gh.factory<_i7.TecknologyBloc>(() => _i7.TecknologyBloc(get<_i3.NewsRepo>()));
  gh.factory<_i8.TopBloc>(() => _i8.TopBloc(get<_i3.NewsRepo>()));
  gh.factory<_i9.AllBloc>(() => _i9.AllBloc(get<_i3.NewsRepo>()));
  gh.factory<_i10.BusinessNewsBloc>(
      () => _i10.BusinessNewsBloc(get<_i3.NewsRepo>()));
  gh.factory<_i11.EntertainmentBloc>(
      () => _i11.EntertainmentBloc(get<_i3.NewsRepo>()));
  gh.factory<_i12.GeneralBloc>(() => _i12.GeneralBloc(get<_i3.NewsRepo>()));
  gh.factory<_i13.HealthBloc>(() => _i13.HealthBloc(get<_i3.NewsRepo>()));
  return get;
}
