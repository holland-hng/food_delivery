import 'package:core_dependency/core_dependency.dart';
import 'package:profile_feature/src/domain/model/shipping_address.dart';
import 'package:profile_feature/src/domain/use_case/shipping_address/get_shipping_address_cached_use_case.dart';

enum ShippingAddressUIState {
  idle,
  gettingCache,
  getCacheSuccess,
  getCacheFail,
}

abstract class ShippingAddressController {
  Rx<ShippingAddressUIState> get rxState;
  Rx<ShippingAddress> get rxAddress;
  void getAddress(String id);
}

@Injectable(as: ShippingAddressController)
class ShippingAddressControllerImpl extends ShippingAddressController {
  final GetShippingAddressCachedUseCase getAddressCached;
  @override
  final Rx<ShippingAddress> rxAddress =
      Rx<ShippingAddress>(ShippingAddress.defaultModel());

  ShippingAddressControllerImpl(this.getAddressCached);

  @override
  Rx<ShippingAddressUIState> rxState = Rx<ShippingAddressUIState>(
    ShippingAddressUIState.idle,
  );
  @override
  void getAddress(String id) {
    assert(rxState.value != ShippingAddressUIState.gettingCache);

    rxState.value = ShippingAddressUIState.gettingCache;

    final result = getAddressCached.execute(id);

    result.when(
      (address) {
        rxAddress.value = address;
        rxState.value = ShippingAddressUIState.getCacheSuccess;
      },
      (error) {
        rxState.value = ShippingAddressUIState.getCacheFail;
      },
    );
  }
}
