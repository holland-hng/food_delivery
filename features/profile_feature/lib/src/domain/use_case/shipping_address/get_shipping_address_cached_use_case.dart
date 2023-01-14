import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/cache_error.dart';
import 'package:core_package/common/error.dart';
import 'package:profile_feature/src/domain/model/shipping_address.dart';
import 'package:profile_feature/src/domain/repository/shipping_address_repository.dart';

@singleton
class GetShippingAddressCachedUseCase {
  final ShippingAddressRepository _repository;

  GetShippingAddressCachedUseCase(this._repository);

  Result<ShippingAddress, AppError> execute(String shippingAddressId) {
    try {
      final addressDao = _repository.getAddressCached(shippingAddressId);
      final address = ShippingAddress.fromDao(addressDao);
      return Success(address);
    } catch (error, stackTrace) {
      return Error(
        AppError(
            error: error,
            stackTrace: stackTrace,
            type: CacheErrorType.getCacheFail),
      );
    }
  }
}
