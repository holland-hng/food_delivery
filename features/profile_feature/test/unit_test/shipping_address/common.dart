import 'package:profile_feature/src/data/shipping_address/model/shipping_address_dao.dart';
import 'package:profile_feature/src/data/shipping_address/repository_impl/shipping_address_repository_impl.dart';
import 'package:profile_feature/src/data/shipping_address/repository_impl/shipping_address_rest_client.dart';

import '../../resource/common.dart';

final successJson = [
  {
    "id": "53",
    "createdAt": "22-04-2022",
    "name": "CNTT K21 Lien Thong",
    "avatar": "avatar CNTT K21"
  },
  {
    "id": "54",
    "createdAt": "15-09-2022",
    "name": "ST20A1B",
    "avatar": "https://donga.edu.vn"
  },
];

final successDto = [
  ShippingAddressDao(
    "id1",
    address: "275 new york",
  ),
  ShippingAddressDao(
    "id2",
    address: "275 nano",
  )
];

final wrongFormatJson = [
  {
    "id": null, //wrong format id
    "createdAt": "22-04-2022",
    "name": "CNTT K21 Lien Thong",
    "avatar": "avatar CNTT K21"
  },
  {
    "id": "54",
    "createdAt": "15-09-2022",
    "name": 456, //wrong format name
    "avatar": "https://donga.edu.vn"
  },
];

final restClient = ShippingAddressRestClient(dio);
final repository = ShippingAddressRepositoryImpl(
  restClient,
  realm,
);
