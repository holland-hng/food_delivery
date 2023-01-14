import 'package:core_package/core_package.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile_feature/src/data/shipping_address/model/shipping_address_dto.dart';
import 'package:profile_feature/src/domain/use_case/shipping_address/fetch_shipping_address_use_case.dart';

import '../../resource/common.dart';
import 'common.dart';

void main() {
  final fetchUseCase = FetchShippingAddressesUseCase(repository);

  group("Shipping address - Fetch list shipping address success: ", () {
    setUp(() {
      dioAdapter.onGet(
        '/tasks',
        (server) => server.reply(
          200,
          successJson,
          delay: const Duration(milliseconds: 10),
        ),
      );
    });

    test("restClient", () async {
      final result = await restClient.fetchShippingAddress();
      expect(result, isA<List<ShippingAddressDto>>());
    });

    test("repository", () async {
      final result = await repository.fetchAddresses();
      expect(result, isA<List<ShippingAddressDto>>());
    });

    test("fetch use case", () async {
      final result = await fetchUseCase.execute();
      expect(result.isSuccess(), true);
    });
  });

  group("Shipping address - Fetch list shipping address wrong format: ", () {
    setUp(() {
      dioAdapter.onGet(
        '/tasks',
        (server) => server.reply(
          200,
          wrongFormatJson,
          delay: const Duration(milliseconds: 10),
        ),
      );
    });

    test("restClient", () async {
      List<ShippingAddressDto>? result;
      Object? error;
      try {
        result = await restClient.fetchShippingAddress();
      } catch (e) {
        error = e;
      }
      expect(result, null);
      expect(error, isA<TypeError>());
    });

    test("repository", () async {
      List<ShippingAddressDto>? result;
      Object? error;
      try {
        result = await repository.fetchAddresses();
      } catch (e) {
        error = e;
      }
      expect(result, null);
      expect(error, isA<TypeError>());
    });

    test("fetch use case", () async {
      final result = await fetchUseCase.execute();
      expect(result.isError(), true);
    });
  });

  group("Shipping address - Fetch list shipping address fail: ", () {
    setUp(() {
      dioAdapter.onGet(
        '/tasks',
        (server) => server.reply(
          504,
          {},
          delay: const Duration(milliseconds: 10),
        ),
      );
    });

    test("restClient", () async {
      List<ShippingAddressDto>? result;
      Object? error;
      try {
        result = await restClient.fetchShippingAddress();
      } catch (e) {
        error = e;
      }
      expect(result, null);
      expect(error, isA<DioError>());
    });

    test("repository", () async {
      List<ShippingAddressDto>? result;
      Object? error;
      try {
        result = await repository.fetchAddresses();
      } catch (e) {
        error = e;
      }
      expect(result, null);
      expect(error, isA<DioError>());
    });

    test("fetch use case", () async {
      final result = await fetchUseCase.execute();
      expect(result.isError(), true);
    });
  });
}
