import '/src/data/shipping_address/model/shipping_address_dao.dart';
import '/src/data/shipping_address/model/shipping_address_dto.dart';

class ShippingAddress {
  final String id;
  final String address;

  ShippingAddress({required this.id, required this.address});

  factory ShippingAddress.fromDao(ShippingAddressDao dao) {
    return ShippingAddress(
      id: dao.id ?? "",
      address: dao.address ?? "",
    );
  }

  factory ShippingAddress.fromDto(ShippingAddressDto dto) {
    return ShippingAddress(
      id: dto.id ?? "",
      address: dto.address ?? "",
    );
  }

  factory ShippingAddress.defaultModel() {
    return ShippingAddress(
      id: "",
      address: "",
    );
  }

  ShippingAddressDao toDao() {
    return ShippingAddressDao(
      id,
      address: address,
    );
  }
}

extension ListShippingAddressExtension on List<ShippingAddress> {
  List<ShippingAddressDao> toListAddressDao() {
    List<ShippingAddressDao> result = map((address) {
      return address.toDao();
    }).toList();
    return result;
  }
}
