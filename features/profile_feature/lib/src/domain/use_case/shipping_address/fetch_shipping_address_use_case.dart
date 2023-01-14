import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/error.dart';
import 'package:profile_feature/src/domain/model/shipping_address.dart';
import 'package:profile_feature/src/domain/repository/shipping_address_repository.dart';

import 'shipping_address_error.dart';

@singleton
class FetchShippingAddressesUseCase {
  final ShippingAddressRepository _repository;

  FetchShippingAddressesUseCase(this._repository);

  Future<Result<List<ShippingAddress>, AppError>> execute() async {
    try {
      final addressesDto = await _repository.fetchAddresses();
      final addresses = addressesDto.map(
        (addressDto) {
          return ShippingAddress.fromDto(addressDto);
        },
      ).toList();
      return Success(addresses);
    } catch (error, stackTrace) {
      return Error(ShippingAddressError(
        error: error,
        stackTrace: stackTrace,
        type: ShippingAddressErrorType.getFail,
      ));
    }
  }
}
