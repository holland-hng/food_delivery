// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_package/core_package.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/data/home/repository/home_repository_impl.dart' as _i11;
import '../../src/data/home/repository/local_data_source.dart' as _i7;
import '../../src/data/home/repository/remote_data_source.dart' as _i9;
import '../../src/data/home/repository/rest_client.dart' as _i8;
import '../../src/domain/repository/home_repository.dart' as _i10;
import '../../src/domain/use_case/add_task_use_case.dart' as _i12;
import '../../src/domain/use_case/cache_homes_use_case.dart' as _i13;
import '../../src/domain/use_case/fetch_home_use_case.dart' as _i14;
import '../../src/domain/use_case/get_homes_cached_use_case.dart' as _i15;
import '../../src/presentation/controllers/banner/banner_controller.dart'
    as _i3;
import '../../src/presentation/controllers/home/home_controller.dart' as _i16;
import '../bridge/home_feature.dart' as _i4;
import '../realm/realm.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.BannerController>(() => _i3.BannerControllerImpl());
  gh.singleton<_i4.HomeFeature>(_i4.HomeFeature());
  gh.singleton<_i5.HomeFeatureRealm>(
      _i5.HomeFeatureRealm(get<_i6.AppDirectory>()));
  gh.singleton<_i7.HomeLocalDataSource>(
      _i7.HomeLocalDataSource(get<_i5.HomeFeatureRealm>()));
  gh.singleton<_i8.TaskRestClient>(_i8.TaskRestClient(get<_i6.Dio>()));
  gh.singleton<_i9.HomeRemoteDataSource>(
      _i9.HomeRemoteDataSource(get<_i8.TaskRestClient>()));
  gh.singleton<_i10.HomeRepository>(_i11.HomeRepositoryImpl(
    get<_i9.HomeRemoteDataSource>(),
    get<_i7.HomeLocalDataSource>(),
  ));
  gh.singleton<_i12.AddTasksUseCase>(
      _i12.AddTasksUseCase(get<_i10.HomeRepository>()));
  gh.singleton<_i13.CacheTasksUseCase>(
      _i13.CacheTasksUseCase(get<_i10.HomeRepository>()));
  gh.singleton<_i14.FetchTasksUseCase>(
      _i14.FetchTasksUseCase(get<_i10.HomeRepository>()));
  gh.singleton<_i15.GetTasksCachedUseCase>(
      _i15.GetTasksCachedUseCase(get<_i10.HomeRepository>()));
  gh.factory<_i16.HomeController>(() => _i16.HomeControllerImpl(
        get<_i13.CacheTasksUseCase>(),
        get<_i14.FetchTasksUseCase>(),
        get<_i15.GetTasksCachedUseCase>(),
        get<_i12.AddTasksUseCase>(),
      ));
  return get;
}
