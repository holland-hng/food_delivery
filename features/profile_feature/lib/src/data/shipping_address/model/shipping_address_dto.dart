import 'dart:async';

import 'package:core_package/core_package.dart';
part 'shipping_address_dto.g.dart';

@JsonSerializable()
class ShippingAddressDto {
  final String? id;
  @JsonKey(name: "name")
  final String? address;

  ShippingAddressDto(this.id, this.address);

  Map<String, dynamic> toJson() => _$ShippingAddressDtoToJson(this);

  factory ShippingAddressDto.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressDtoFromJson(json);
}

FutureOr<List<ShippingAddressDto>> deserializeShippingAddressDtoList(
        List<Map<String, dynamic>> json) =>
    json.map((e) => ShippingAddressDto.fromJson(e)).toList();
