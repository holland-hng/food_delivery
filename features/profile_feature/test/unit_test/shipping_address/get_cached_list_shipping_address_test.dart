import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:profile_feature/src/data/shipping_address/model/shipping_address_dao.dart';
import 'package:profile_feature/src/domain/use_case/shipping_address/get_shipping_address_cached_use_case.dart';

import '../../resource/common.dart';
import 'common.dart';

void main() {
  final getCachedUseCase = GetShippingAddressCachedUseCase(repository);

  setUp(() {
    when(realm.getList<ShippingAddressDao>()).thenReturn(successDto);
  });

  test("Shipping address - Get cached list shipping address success: ", () {});
}
