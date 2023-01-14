import '/src/data/shipping_address/model/shipping_address_dao.dart';
import '/src/data/shipping_address/model/shipping_address_dto.dart';

abstract class ShippingAddressRepository {
  Future<List<ShippingAddressDto>> fetchAddresses();
  ShippingAddressDao getAddressCached(String id);
  void cacheAddresses(List<ShippingAddressDao> addresses);
}
