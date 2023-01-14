import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'package:flutter/foundation.dart';
import 'package:profile_feature/src/data/shipping_address/model/shipping_address_dto.dart';

part 'shipping_address_rest_client.g.dart';

@RestApi(
  parser: Parser.FlutterCompute,
  baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/",
)
@singleton
abstract class ShippingAddressRestClient {
  @factoryMethod
  factory ShippingAddressRestClient(Dio dio) = _ShippingAddressRestClient;

  @GET("/tasks")
  Future<List<ShippingAddressDto>> fetchShippingAddress();
}
