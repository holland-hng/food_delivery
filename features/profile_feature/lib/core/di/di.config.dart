// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_package/core_package.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/data/shipping_address/repository_impl/shipping_address_repository_impl.dart'
    as _i8;
import '../../src/data/shipping_address/repository_impl/shipping_address_rest_client.dart'
    as _i6;
import '../../src/domain/repository/shipping_address_repository.dart' as _i7;
import '../../src/domain/use_case/shipping_address/cache_shipping_address_use_case.dart'
    as _i9;
import '../../src/domain/use_case/shipping_address/fetch_shipping_address_use_case.dart'
    as _i10;
import '../../src/domain/use_case/shipping_address/get_shipping_address_cached_use_case.dart'
    as _i11;
import '../../src/presentation/controllers/profile/profile_controller.dart'
    as _i12;
import '../../src/presentation/controllers/shipping_address/shipping_address_controller.dart'
    as _i13;
import '../bridge/profile_feature.dart' as _i3;
import '../realm/realm.dart' as _i4; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i3.ProfileFeature>(_i3.ProfileFeature());
  gh.singleton<_i4.ProfileFeatureRealm>(
      _i4.ProfileFeatureRealm(get<_i5.AppDirectory>()));
  gh.singleton<_i6.ShippingAddressRestClient>(
      _i6.ShippingAddressRestClient(get<_i5.Dio>()));
  gh.singleton<_i7.ShippingAddressRepository>(_i8.ShippingAddressRepositoryImpl(
    get<_i6.ShippingAddressRestClient>(),
    get<_i4.ProfileFeatureRealm>(),
  ));
  gh.singleton<_i9.CacheShippingAddressesUseCase>(
      _i9.CacheShippingAddressesUseCase(get<_i7.ShippingAddressRepository>()));
  gh.singleton<_i10.FetchShippingAddressesUseCase>(
      _i10.FetchShippingAddressesUseCase(get<_i7.ShippingAddressRepository>()));
  gh.singleton<_i11.GetShippingAddressCachedUseCase>(
      _i11.GetShippingAddressCachedUseCase(
          get<_i7.ShippingAddressRepository>()));
  gh.factory<_i12.ProfileController>(() => _i12.ProfileControllerImpl(
        get<_i10.FetchShippingAddressesUseCase>(),
        get<_i9.CacheShippingAddressesUseCase>(),
      ));
  gh.factory<_i13.ShippingAddressController>(() =>
      _i13.ShippingAddressControllerImpl(
          get<_i11.GetShippingAddressCachedUseCase>()));
  return get;
}
