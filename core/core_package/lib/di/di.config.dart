// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_dependency/core_dependency.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../core_package.dart' as _i11;
import '../src/app_directory/app_directory.dart' as _i3;
import '../src/auth/data/repository/auth_local_data_source.dart' as _i4;
import '../src/auth/data/repository/auth_remote_data_source.dart' as _i5;
import '../src/auth/data/repository/auth_service.dart' as _i8;
import '../src/auth/data/repository/auto_repository_impl.dart' as _i7;
import '../src/auth/domain/repository/auth_repository.dart' as _i6;
import '../src/auth/domain/use_case/auth_use_case.dart' as _i15;
import '../src/auth/domain/use_case/cache_auth_use_case.dart' as _i9;
import '../src/auth/domain/use_case/check_auth_use_case.dart' as _i10;
import '../src/auth/domain/use_case/get_auth_use_case.dart' as _i13;
import '../src/auth/test_presentation/auth_controller.dart' as _i16;
import 'dio_module.dart' as _i18;
import 'register_module.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  final dIOModule = _$DIOModule();
  await gh.factoryAsync<_i3.AppDirectory>(
    () => registerModule.appDirectory,
    preResolve: true,
  );
  gh.singleton<_i4.AuthLocalDataSource>(_i4.AuthLocalDataSource());
  gh.singleton<_i5.AuthRemoteDataSource>(_i5.AuthRemoteDataSource());
  gh.singleton<_i6.AuthRepository>(_i7.AuthRepositoryImpl(
    get<_i4.AuthLocalDataSource>(),
    get<_i5.AuthRemoteDataSource>(),
  ));
  gh.singleton<_i8.AuthService>(_i8.AuthService());
  gh.singleton<_i9.CacheAuthUserCase>(
      _i9.CacheAuthUserCase(get<_i6.AuthRepository>()));
  gh.singleton<_i10.CheckAuthUseCase>(
      _i10.CheckAuthUseCase(get<_i6.AuthRepository>()));
  gh.lazySingleton<_i11.Dio>(() => dIOModule.dio());
  gh.lazySingleton<_i12.EventBus>(() => registerModule.eventBus);
  gh.singleton<_i13.GetAuthUseCase>(
      _i13.GetAuthUseCase(get<_i6.AuthRepository>()));
  await gh.factoryAsync<_i14.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i15.AuthUseCase>(_i15.AuthUseCase(
    cacheAuth: get<_i9.CacheAuthUserCase>(),
    checkAuth: get<_i10.CheckAuthUseCase>(),
    getAuth: get<_i13.GetAuthUseCase>(),
  ));
  gh.singleton<_i16.AuthController>(
      _i16.AuthController(get<_i15.AuthUseCase>()));
  return get;
}

class _$RegisterModule extends _i17.RegisterModule {}

class _$DIOModule extends _i18.DIOModule {}
