import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/cache_error.dart';
import 'package:core_package/common/error.dart';
import 'package:profile_feature/src/data/shipping_address/model/shipping_address_dao.dart';
import 'package:profile_feature/src/domain/repository/shipping_address_repository.dart';

@singleton
class CacheShippingAddressesUseCase {
  final ShippingAddressRepository _repository;

  CacheShippingAddressesUseCase(this._repository);

  Result<bool, AppError> execute(List<ShippingAddressDao> addresses) {
    try {
      _repository.cacheAddresses(addresses);
      return const Success(true);
    } catch (error, stackTrace) {
      return Error(
        CacheError(
          error: error,
          type: CacheErrorType.cacheFail,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
